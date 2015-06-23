# Maintainer: choopm <choopm at 0pointer.org>
# Contributor: BOYPT <pentie at gmail.com>

pkgname=sunxi-tools-git
_pkgname=sunxi-tools
pkgver=v1.1.r201.gb80e7ce
pkgrel=1
pkgdesc="Tools to help hacking Allwinner based devices. (A10, A20, sun4i, sun7i)"
arch=('i686' 'x86_64')
url="https://github.com/linux-sunxi/sunxi-tools"
license=('GPL')
depends=(libusb)
makedepends=(git libusb)
conflicts=()
provides=()
source=('git+https://github.com/linux-sunxi/sunxi-tools.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  install -Dm755 -d $pkgdir/usr/bin
  install -Dm755 -t $pkgdir/usr/bin fexc bootinfo fel nand-part usb-boot
  cd $pkgdir/usr/bin
  ln -s fexc bin2fex
  ln -s fexc fex2bin
}
