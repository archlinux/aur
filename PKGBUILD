# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=desmume-highscore-git
pkgver=r7050.2930679
pkgrel=1
pkgdesc="Highscore port of DeSmuME"
arch=('x86_64')
url="https://github.com/highscore-emu/desmume"
license=('GPL-2.0-or-later')
depends=(
  'libhighscore-git'
  'libpcap'
  'sdl2'
)
makedepends=(
  'git'
  'meson'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/highscore-emu/desmume.git')
sha256sums=('SKIP')

pkgver() {
  cd desmume
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd desmume/desmume/src/frontend
  arch-meson highscore build
  meson compile -C build
}

package() {
  cd desmume/desmume/src/frontend
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
