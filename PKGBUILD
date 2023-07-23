# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>
# Contributor: Milan Toth <milgra@milgra.com>

pkgname=sov-git
_gitname=sov
pkgver=0.71.r8.ge57a84f
pkgrel=1
pkgdesc='An overlay that shows schemas for all workspaces to make navigation in sway easier (git)'
arch=('i686' 'x86_64')
url='https://github.com/milgra/sov'
license=('GPL3')
depends=(freetype2 glew libegl libgl libpng libxkbcommon wayland)
makedepends=('git' 'meson' 'wayland-protocols')
source=("git+https://github.com/milgra/sov.git")
b2sums=('SKIP')
provides=('sov')
conflicts=('sov')

pkgver(){
  cd "${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  meson setup --prefix=/usr --buildtype=plain "${_gitname}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}

