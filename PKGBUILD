# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Tom Richards <tom@tomrichards.net>
pkgname=highscore-git
pkgver=r869.b1d9f20
pkgrel=2
pkgdesc="A rewrite of Highscore, formerly gnome-games"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/highscore"
license=('GPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'libadwaita>=1.6'
  'libgee'
  'libhighscore-git'
  'libmanette'
  'libmirage'
  'libpulse'
  'sdl2'
)
makedepends=(
  'git'
  'meson'
  'vala'
)
optdepends=(
  'blastem-highscore-git: BlastEm core'
  'bsnes-highscore-git: BSNES core'
  'desmume-highscore-git: DeSmuME core'
  'gearsystem-highscore-git: Gearsystem core'
  'mednafen-highscore-git: Mednafen core'
  'mgba-highscore-git: mGBA core'
  'mupen64plus-highscore-git: Mupen64Plus core'
  'nestopia-highscore-git: Nestopia JG core'
  'prosystem-highscore-git: ProSystem JG core'
#  'stella-highscore-git: Stella core'  ## WIP
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/World/highscore.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
