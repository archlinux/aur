# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=bsnes-highscore-git
pkgver=r1815.e5969aa
pkgrel=1
pkgdesc="Highscore port of bsnes-JG"
arch=('x86_64')
url="https://gitlab.com/highscore-emu/bsnes"
license=('GPL-3.0-or-later')
depends=(
  'glib2'
  'libhighscore-git'
  'libsamplerate'
)
makedepends=(
  'git'
  'meson'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.com/highscore-emu/bsnes.git')
sha256sums=('SKIP')

pkgver() {
  cd bsnes
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd bsnes
  arch-meson highscore build
  meson compile -C build
}

package() {
  cd bsnes
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
