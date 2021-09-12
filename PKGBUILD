# Maintainer: David Thurstenson <thurstylark@gmail.com>
# Contributor: Germain Z. <https://github.com/GermainZ>
# Contributor: Zhangyuan Nie <zyntuz@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# See https://www.brad-x.com/2017/08/07/quick-tip-setting-the-color-space-value-in-wayland/ for instructions

_pkgname=libdrm
pkgname=${_pkgname}-proptest
pkgver=2.4.107
pkgrel=1
pkgdesc="A test suit for libdrm that can be used to set RGB settings in wayland"
arch=(x86_64)
license=('custom')
depends=('libdrm')
makedepends=('meson')
url="http://dri.freedesktop.org/"
source=(https://dri.freedesktop.org/$_pkgname/$_pkgname-$pkgver.tar.xz
        COPYING)
sha512sums=('c7542ba15c4c934519a6a1f3cb1ec21effa820a805a030d0175313bb1cc796cd311f39596ead883f9f251679d701e262894c5a297d5cf45093c80a6cd818def0'
            'b0ca349b882a4326b19f81f22804fabdb6fb7aef31cdc7b16b0a7ae191bfbb50c7daddb2fc4e6c33f1136af06d060a273de36f6f3412ea326f16fa4309fda660')

build() {
  cd $_pkgname-$pkgver
  meson build/
  meson configure build/ -Dprefix=/usr
  ninja -C build/
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "$srcdir/$_pkgname-$pkgver/build/tests/proptest/proptest" "$pkgdir/usr/bin/proptest"
  install -m755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/"
}
