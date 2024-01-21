# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=smooth-git
pkgver=0.9.8.r17.g4d48e854
pkgrel=2
pkgdesc="An object oriented C++ class library"
arch=('x86_64')
url="http://www.smooth-project.org"
license=('Artistic-2.0')
depends=('gtk3' 'libjpeg-turbo' 'libxml2')
makedepends=('git')
provides=("${pkgname%-git}" 'libsmooth-0.9.so')
conflicts=("${pkgname%-git}")
source=('git+https://github.com/enzo1982/smooth.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "{pkgname%-git}"
  find . -type f -exec sed -i 's|/usr/local|/usr|g' {} \;
}

build() {
  cd "${pkgname%-git}"
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="$pkgdir/" install

  ln -s "/usr/lib/libsmooth-${pkgver%.*}.so" "${pkgdir}/usr/lib/libsmooth.so"
}
