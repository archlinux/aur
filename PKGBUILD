# Maintainer: Sean Ho <holishing at ccns dot ncku dot edu dot tw>

pkgname=ibus-libzhuyin
pkgver=1.10.3
pkgrel=1
pkgdesc="New Zhuyin engine based on libzhuyin for IBus"
arch=('x86_64')
license=('GPL2')
url="https://github.com/libzhuyin/ibus-libzhuyin"
# libpinyin provides both libpinyin.so and libzhuyin.so
depends=('ibus' 'opencc' 'python-xdg' 'libpinyin')
makedepends=('git' 'intltool' 'gnome-common' 'wget')
source=("$pkgname-$pkgver.tar.gz::https://github.com/libzhuyin/ibus-libzhuyin/archive/$pkgver.tar.gz")
sha512sums=('e4f18852d68df0928d36f02a23cf7a94f770b7a57eaa9f5ff5deecf722dceb65b9e253d8ba63f56914e786a0fbce2271631bdb4c411cd04c27b5d496dabe26a5')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh --prefix=/usr --libexecdir=/usr/lib/$pkgname --enable-opencc
  make
}

package() {
  cd $pkgname-$pkgver
  make NO_INDEX=true DESTDIR="$pkgdir" install
}
