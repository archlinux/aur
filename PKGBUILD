# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Luke Street <luke.street@encounterpc.com>
pkgname=gnome-shell-extension-gamemode-git
pkgver=12.0.r2.g4ef8d2e
pkgrel=1
pkgdesc="GameMode Status Indicator for GNOME Shell"
arch=('any')
url="https://github.com/trsnaqe/gamemode-shell-extension"
license=('LGPL-2.1-or-later')
depends=(
  'gamemode'
  'gnome-shell'
)
makedepends=(
  'git'
  'meson'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/trsnaqe/gamemode-shell-extension.git')
sha256sums=('SKIP')

pkgver() {
  cd gamemode-shell-extension
  git describe --long --tags --abbrev=7 | sed 's/^V//;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson gamemode-shell-extension build
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
