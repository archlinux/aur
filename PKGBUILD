# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Timur Antipin < kosmocap (at) gmail.com >

pkgname=joy2key
pkgver=1.6.3
pkgrel=3
pkgdesc='Translate joystick movements into keystrokes'
arch=('x86_64' 'i686')
url='https://sourceforge.net/projects/joy2key/'
license=('GPL2')
depends=('libx11' 'xorg-xwininfo')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2"
        "http://sourceforge.net/p/joy2key/patches/_discuss/thread/e73f20a1/33d7/attachment/button_list_segfault.patch")
sha256sums=('cf6f452632bb661cf889d843e9ebb9f4fe6ddf4bfe14193ebf74c2d1e2b89f50'
            '10eff65bc28b321e60c4b3573c29c8e9e8c000938111a15e4110f99d8bc2b66c')

prepare() {
  patch -p0 -i button_list_segfault.patch
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr -x-libraries=/usr/lib
  make
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
