# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Sung Mingi <FiestaLake@protonmail.com>
pkgname=gnome-shell-extension-extension-list-git
pkgver=49.0.r0.g3d126c5
pkgrel=1
pkgdesc="GNOME Shell extension to manage extensions from the top panel"
arch=('any')
url="https://github.com/tuberry/extension-list"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=(
  'git'
  'meson'
  'sassc'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/tuberry/extension-list.git')
sha256sums=('SKIP')

pkgver() {
  cd extension-list
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson extension-list build -Dtarget=system
  meson compile -C build
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"
}
