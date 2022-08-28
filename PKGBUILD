# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: choopm <choopm at 0pointer.org>
# Contributor: BOYPT <pentie at gmail.com>

pkgname=sunxi-tools-git
pkgver=1.4.2.r161.g5cf618a
pkgrel=2
pkgdesc="Tools to help hacking Allwinner based devices. (A10, A20, sun4i, sun7i)"
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url="https://github.com/linux-sunxi/sunxi-tools"
license=(GPL)
depends=(libusb dtc)
makedepends=(git)
conflicts=(sunxi-tools)
provides=(sunxi-tools)
source=("git+https://github.com/linux-sunxi/sunxi-tools.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"
  make
  make misc
}

package() {
  cd "${pkgname%-git}"
  PREFIX="$pkgdir/usr" make install
  PREFIX="$pkgdir/usr" make install-misc
}

