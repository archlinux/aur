# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=smooth-git
pkgver=0.9.8.r17.g4d48e854
pkgrel=1
pkgdesc="An object oriented C++ class library"
arch=('x86_64')
url="http://www.smooth-project.org"
license=('Artistic2.0')
depends=('gtk3' 'libjpeg-turbo' 'libxml2')
makedepends=('git')
provides=("${pkgname%-git}" 'libsmooth-0.9.so')
conflicts=("${pkgname%-git}")
source=('git+https://github.com/enzo1982/smooth.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  find . -type f -exec sed -i 's|/usr/local|/usr|g' {} \;
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}
