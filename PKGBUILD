# Maintainer: VIVID <vivid@headrat.org>

_pkgname=libg15
pkgname=$_pkgname-git
pkgver=1.3.1.r0.g132f443
pkgrel=2
pkgdesc="Provides low-level access to the Logitech G15 and G11 keyboards and Z10 speakers"
arch=('x86_64')
url="https://github.com/vividnightmare/$_pkgname"
license=('GPL')
depends=('libusb-compat')
conflicts=('libg15')
provides=('libg15')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  chmod +x ${pkgname}/configure
  cd "${pkgname}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
