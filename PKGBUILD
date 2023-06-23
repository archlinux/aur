# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=pragtical
pkgver=3.0.0
_widget_ver=ae7871c08112b5dc0582e7c26a5ba34d15124ac9
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
  'd815eafa12f118a1197fddae0ec7acab65ee7d05043a85a756b5f8e9a267d9cf'
  'f944845000e71d30345ab62d1108e0bed2870364290ef0487fb6387531626c8e'
)

prepare() {
  cp -a "widget-$_widget_ver/." "pragtical-$pkgver/data/widget"
}

build() {
  cd "pragtical-$pkgver"
  arch-meson --buildtype release build
  meson compile -C build
}

package() {
  cd "pragtical-$pkgver"
  DESTDIR="$pkgdir" meson install --skip-subprojects -C build

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "/usr/share/doc/pragtical/licenses.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
