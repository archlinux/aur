# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=pragtical
pkgver=3.1.0
_widget_ver=db1c8cdc52f79753e14016a95ea3967fd833c388
pkgrel=1
pkgdesc='The practical and pragmatic code editor.'
arch=('x86_64')
url="https://github.com/pragtical/pragtical"
license=('MIT')
depends=('luajit' 'sdl2' 'freetype2' 'pcre2' 'uchardet' 'hicolor-icon-theme')
makedepends=('meson>=0.58')
source=(
  "https://github.com/pragtical/pragtical/archive/refs/tags/v$pkgver.tar.gz"
  "https://github.com/pragtical/widget/archive/$_widget_ver.zip"
)
sha256sums=(
  '5c51d4e6f22716702a6d8cd6837feac074064a91a6361bbd497861c77efb5d7d'
  '2b399d568ea2c4b3ccd04443e024e0ff26a82c4bd6e74090386bf7e03f92b377'
)

prepare() {
  cp -a "widget-$_widget_ver/." "pragtical-$pkgver/data/widget"
}

build() {
  cd "pragtical-$pkgver"
  arch-meson --buildtype release -Duse_system_lua=true build
  meson compile -C build
}

package() {
  cd "pragtical-$pkgver"
  DESTDIR="$pkgdir" meson install --skip-subprojects -C build

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "/usr/share/doc/pragtical/licenses.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
