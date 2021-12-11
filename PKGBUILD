# Maintainer: Mark Wagie <mark dot wagie at tutanota.com>
# Contributor: Luke Street <luke.street@encounterpc.com>
pkgname=gnome-shell-extension-gamemode-git
pkgver=6.r1.g345dc61
pkgrel=1
pkgdesc="GNOME Shell extension for Feral Interactive's GameMode"
arch=('any')
url="https://github.com/gicmo/gamemode-extension"
license=('GPL2')
depends=('gamemode' 'gnome-shell')
makedepends=('meson' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/gicmo/gamemode-extension.git')
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/gamemode-extension
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson gamemode-extension build
  meson compile -C build
}

# No tests defined
#check() {
#  meson test -C build --print-errorlogs
#}

package() {
  meson install -C build --destdir "$pkgdir"
}
