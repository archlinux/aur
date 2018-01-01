# Maintainer: Zhangyuan Nie <zyntuz@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# See https://www.brad-x.com/2017/08/07/quick-tip-setting-the-color-space-value-in-wayland/ for instructions

_pkgname=libdrm
pkgname=${_pkgname}-proptest
pkgver=2.4.88
pkgrel=1
pkgdesc="A test suit for libdrm that can be used to set RGB settings in wayland"
arch=(x86_64)
license=('custom')
depends=('libdrm')
url="http://dri.freedesktop.org/"
source=(https://dri.freedesktop.org/$_pkgname/$_pkgname-$pkgver.tar.bz2
        COPYING)
sha512sums=('0d9d4bcc0d9be1fb6b1ca075339b22b0f927288a4c02bbcbf95406b5c095051890f3d2e0d32e529ef9b6952ce1250afd1e0765ad3188c2bac924dda8c33afabb'
            'b0ca349b882a4326b19f81f22804fabdb6fb7aef31cdc7b16b0a7ae191bfbb50c7daddb2fc4e6c33f1136af06d060a273de36f6f3412ea326f16fa4309fda660')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --enable-udev
  make
}

package() {
  cd "$srcdir"
  install -D -m755 "$srcdir/$_pkgname-$pkgver/tests/proptest/.libs/proptest" "$pkgdir/usr/bin/proptest"
  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/"
}
