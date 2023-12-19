# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=pragtical
pkgver=3.2.1
pkgrel=1
pkgdesc='The practical and pragmatic code editor.'
arch=('x86_64')
url="https://github.com/pragtical/pragtical"
license=('MIT')
depends=(
  # Editor Dependencies
  'luajit' 'sdl2' 'freetype2' 'pcre2' 'uchardet' 'hicolor-icon-theme'
  # Plugin Manager Dependencies
  'lua' 'zlib' 'mbedtls2' 'libgit2' 'libzip'
)
makedepends=('meson>=0.58')
source=(
  "https://github.com/pragtical/pragtical/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('a0fdbc20cd07095d0277f9a4709c0cf72434d7faa7771fa9330b449fe8d739a8')

build() {
  cd "pragtical-$pkgver"
  arch-meson --wrap-mode default --buildtype release -Duse_system_lua=true build
  meson compile -C build
}

package() {
  cd "pragtical-$pkgver"
  DESTDIR="$pkgdir" meson install -C build

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s "/usr/share/doc/pragtical/licenses.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
