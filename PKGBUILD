# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Tom Richards <tom@tomrichards.net>
pkgname=highscore-git
pkgver=r2063.ce5b5b5
pkgrel=1
pkgdesc="A rewrite of Highscore, formerly gnome-games"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/highscore"
license=('GPL-3.0-or-later')
depends=(
  'feedbackd'
  'hicolor-icon-theme'
  'hidapi'
  'libadwaita'
  'libarchive'
  'libepoxy'
  'libgee'
  'libhighscore-git'
  'libmanette'
  'libmirage'
  'libpulse'
  'librsvg'
  'sdl2'
  'sqlite'
)
makedepends=(
  'blueprint-compiler'
  'git'
  'meson'
  'vala'
)
optdepends=(
  'blastem-highscore-git: BlastEm core'
  'bsnes-highscore-git: bsnes JG core'
  'desmume-highscore-git: DeSmuME core'
  'gearsystem-highscore-git: Gearsystem core'
  'genesis-plus-gx-highscore-git: Genesis Plus GX core'
  'kronos-highscore-git: Kronos core'
  'mednafen-highscore-git: Mednafen core'
  'melonds-highscore-git: melonDS core'
  'mgba-highscore-git: mGBA core'
  'mupen64plus-highscore-git: Mupen64Plus core'
  'nestopia-highscore-git: Nestopia JG core'
  'picodrive-highscore-git: PicoDrive core'
  'prosystem-highscore-git: ProSystem JG core'
  'sameboy-highscore-git: SameBoy core'
  'stella-highscore-git: Stella core'
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
  meson test -C build --no-rebuild --print-errorlogs
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
