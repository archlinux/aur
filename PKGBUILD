# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Tom Richards <tom@tomrichards.net>
pkgname=highscore-git
pkgver=r435.fd3c2851
pkgrel=2
pkgdesc="A retro gaming application for the GNOME desktop"
arch=('x86_64' 'aarch64')
url="https://wiki.gnome.org/Apps/Games"
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
provides=("${pkgname%-git}" 'gnome-games')
conflicts=("${pkgname%-git}" 'gnome-games')
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
