# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

_pkgname=dragon
pkgname=dragon-drop-git
pkgver=1.2.0.r0.g07fd608
pkgrel=1
pkgdesc='Simple drag-and-drop source/sink for X or Wayland'
arch=('i686' 'x86_64')
url='https://github.com/mwh/dragon'
license=('GPL3')
depends=('gtk3')
makedepends=('git')
provides=('dragon-drop')
conflicts=('dragon-drop' 'dragon-drag-and-drop' 'dragon-drag-and-drop-git')
replaces=('dragon-drag-and-drop-git')
source=("$_pkgname::git+https://github.com/mwh/dragon")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  make NAME=${pkgname%-git}
}

package() {
  cd "$_pkgname"
  make DESTDIR="${pkgdir}/usr" PREFIX='' NAME=${pkgname%-git} install
}
