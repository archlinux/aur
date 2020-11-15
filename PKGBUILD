# Maintainer: David Thurstenson <thurstylark@gmail.com>
# Contributor: Germain Z. <https://github.com/GermainZ>
# Contributor: Zhangyuan Nie <zyntuz@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# See https://www.brad-x.com/2017/08/07/quick-tip-setting-the-color-space-value-in-wayland/ for instructions

_pkgname=libdrm
pkgname=${_pkgname}-proptest
pkgver=2.4.103
pkgrel=1
pkgdesc="A test suit for libdrm that can be used to set RGB settings in wayland"
arch=(x86_64)
license=('custom')
depends=('libdrm')
url="http://dri.freedesktop.org/"
source=(https://dri.freedesktop.org/$_pkgname/$_pkgname-$pkgver.tar.xz
        COPYING)
sha512sums=('15b098b962008271400692b6b15ecb7e22676f8698e0220ad969735ac2315ccc737d19558afb6abda82bae15117e5f306c048184a2369f434b85ecaa670ca885'
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
