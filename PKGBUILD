# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: choopm <choopm at 0pointer.org>
# Contributor: BOYPT <pentie at gmail.com>

pkgname=sunxi-tools-git
pkgver=1.1.r425.g5c19710
pkgrel=2
pkgdesc="Tools to help hacking Allwinner based devices. (A10, A20, sun4i, sun7i)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/linux-sunxi/sunxi-tools"
license=('GPL')
depends=(libusb)
makedepends=(git)
conflicts=('sunxi-tools')
provides=('sunxi-tools')
source=("${pkgname}::git+https://github.com/linux-sunxi/sunxi-tools.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  PREFIX="$pkgdir/usr" make install
}
