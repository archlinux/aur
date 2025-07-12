# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=kronos-highscore-git
pkgver=r7747.2422016
pkgrel=1
pkgdesc="Highscore port of Kronos (WIP)"
arch=('x86_64')
url="https://github.com/highscore-emu/Kronos"
license=('LicenseRef-unknown')
depends=(
  'libepoxy'
  'libhighscore-git'
  'zlib'
)
makedepends=(
  'git'
  'meson'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/highscore-emu/Kronos.git')
sha256sums=('SKIP')

pkgver() {
  cd Kronos
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd Kronos/yabause/src
  arch-meson highscore build
  meson compile -C build
}

package() {
  cd Kronos/yabause/src
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
