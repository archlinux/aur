# Maintainer: Sean Ho <holishing at ccns dot ncku dot edu dot tw>

pkgname=ibus-libzhuyin
pkgver=1.10.2
pkgrel=1
pkgdesc="New Zhuyin engine based on libzhuyin for IBus"
arch=('x86_64')
license=('GPL2')
url="https://github.com/libzhuyin/ibus-libzhuyin"
# libpinyin provides both libpinyin.so and libzhuyin.so
depends=('ibus' 'opencc' 'python-xdg' 'libpinyin')
makedepends=('git' 'intltool' 'gnome-common' 'wget')
source=("$pkgname-$pkgver.tar.gz::https://github.com/libzhuyin/ibus-libzhuyin/archive/$pkgver.tar.gz")
sha512sums=('ff71f881973d18c1b8b9aa8a9b1a5814383b9a3a88135163820241a0b5d28abc8d3bf0715b83878e32526df84eeb6a6f5a864062f0be89dec63b2c6ece34645e')

build() {
  cd $pkgname-$pkgver
  ./autogen.sh --prefix=/usr --libexecdir=/usr/lib/$pkgname --enable-opencc
  make
}

package() {
  cd $pkgname-$pkgver
  make NO_INDEX=true DESTDIR="$pkgdir" install
}
