# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=sunxi-tools-f1c100s-spiflash-git
_pkgname=${pkgname%-git}
pkgver=v1.1.r441.g11a9d20
pkgrel=1
pkgdesc="tools to help hacking Allwinner SoC devices"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Icenowy/sunxi-tools/tree/f1c100s-spiflash"
license=('GPL')
depends=('libusb' 'zlib')
makedepends=('git')
conflicts=('sunxi-tools')
source=("${_pkgname}::git+https://github.com/Icenowy/sunxi-tools.git#branch=f1c100s-spiflash")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_pkgname}
  make
  make misc
}

package() {
  cd ${_pkgname}
  PREFIX="$pkgdir/usr" make install
  PREFIX="$pkgdir/usr" make install-misc
}

# vim: set sw=2 ts=2 et:
