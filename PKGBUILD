# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Tom Richards <tom@tomrichards.net>
pkgname=highscore-git
pkgver=r435.fd3c2851
pkgrel=3
pkgdesc="A rewrite of Highscore, formerly gnome-games"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/highscore"
license=('GPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'libadwaita'
  'libgee'
  'libhighscore-git'
  'libmanette'
  'libpulse'
  'sdl2'
)
makedepends=(
  'git'
  'meson'
  'vala'
)
optdepends=(
  'blastem-highscore-git'
  'bsnes-highscore-git'
  'desmume-highscore-git'
  'gearsystem-highscore-git'
  'mednafen-highscore-git'
  'mgba-highscore-git'
  'mupen64plus-highscore-git'
#  'nestopia-highscore-git'  ## WIP
#  'prosystem-highscore-git'  ## WIP
#  'stella-highscore-git'  ## WIP
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/World/highscore.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
