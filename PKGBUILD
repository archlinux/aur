# Maintainer: mochaaP <aur@mochaa.ws>

pkgname=warble
pkgver=1.3.1
pkgrel=1
pkgdesc="Native Linux word-guessing game built in Vala and Gtk"
url="https://github.com/avojak/${pkgname}"
arch=($CARCH)
license=('GPL')
source=("${url}/archive/${pkgver}.tar.gz"
        "${url}/commit/65d044a94656fb4ba4a569e6acd0c300d847e17d.diff")
sha256sums=('1d0764b508eb083f18010a7bc07a7edb1a8238863d8eb1a7ebe537edb9864f96'
            '5a9082beb66705208e710debf27f75bb2f9b0aa669dd239d959f58c449d00338')
depends=('granite>=0.6.0' 'gtk3>=3.10' 'libhandy>=1.0.0' 'libgee')
makedepends=(meson 'vala>=0.28.0')

prepare() {
    patch -R -p1 -d "${pkgname}-${pkgver}" < 65d044a94656fb4ba4a569e6acd0c300d847e17d.diff
}

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
