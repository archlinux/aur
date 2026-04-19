# Maintainer:  nardholio <nardholio at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Israel Herraiz <isra@herraiz.org>
# Contributor: jorge_barroso <jorge.barroso.11@gmail.com>
# Contributor: Ray Griffin <rorgoroth@googlemail.com>
# Contributor: Jonathan Wiersma <arch aur at jonw dot org>

pkgname=freeciv-sdl2
_pkgname=freeciv
pkgver=3.2.4
pkgrel=1
pkgdesc="A multiuser clone of the famous Microprose game of Civilization - SDL2 Client"
arch=('i686' 'x86_64')
url="https://www.freeciv.org"
license=('GPL')
depends=(
  'bzip2'
  'curl'
  'hicolor-icon-theme'
  'icu'
  'lua54'
  'qt6-base'
  'qt6-svg'
  'readline'
  'sdl2'
  'sdl2_gfx'
  'sdl2_image'
  'sdl2_mixer'
  'sdl2_ttf'
  'sqlite'
  'xz'
  'zlib'
  'zstd'
)
makedepends=(
  'meson'
  'python'
  'git'
  'qt6-tools'
)
conflicts=('freeciv' 'freeciv-git')
options=('!libtool')

source=("git+https://github.com/freeciv/freeciv.git#tag=R${pkgver//./_}")
sha256sums=('df64b2e6aa4d6eafbcefa694ca0a7f81b6dd1d7a10a8cf82322be8f1fdd7a420')

build() {
  cd "$srcdir"/$_pkgname

  arch-meson build \
    -Dsyslua=true \
    -Dclients=sdl2 \
    -Dfcmp=cli

  meson compile -C build
}

package() {
  cd "$srcdir"/$_pkgname

  meson install -C build --destdir="$pkgdir"
}
