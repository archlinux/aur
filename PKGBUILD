# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Luke Street <luke.street@encounterpc.com>
pkgname=gnome-shell-extension-gamemode-git
pkgver=8.r2.gf4b5a35
pkgrel=1
pkgdesc="GNOME Shell extension for Feral Interactive's GameMode"
arch=('any')
url="https://github.com/gicmo/gamemode-extension"
license=('GPL2')
depends=('gamemode' 'gnome-shell<=44')
makedepends=('meson' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/gicmo/gamemode-extension.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/gamemode-extension"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson gamemode-extension build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
