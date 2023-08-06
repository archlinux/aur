# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=pragtical
pkgver=3.1.1
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
)
sha256sums=('89169df2957e28a1ad072e5319dc4aeb40fb0bde18a86df73a774cfacfa428fa')

build() {
  cd "pragtical-$pkgver"
  arch-meson --wrap-mode default --buildtype release -Duse_system_lua=true build
  meson compile -C build
}

package() {
  cd "pragtical-$pkgver"
  DESTDIR="$pkgdir" meson install --skip-subprojects -C build

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "/usr/share/doc/pragtical/licenses.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
