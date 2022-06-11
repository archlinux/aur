# Maintainer: Milan Toth <milgra@milgra.com>

pkgname=sov-git
_gitname=sov
pkgver=0.71.r2.g3c86d6a
pkgrel=1
pkgdesc='An overlay that shows schemas for all workspaces to make navigation in sway easier (git)'
arch=('i686' 'x86_64')
url='https://github.com/milgra/sov'
license=('MIT')
depends=('wayland')
makedepends=('meson' 'wayland-protocols' 'freetype2' 'git')
source=(
	"git+https://github.com/milgra/sov.git"
)

b2sums=(
	'SKIP'
)

prepare() {
	arch-meson build "${_gitname}" --buildtype=release
}

pkgver(){
  cd "${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	ninja -C build
}

package() {
	DESTDIR="${pkgdir}" ninja -C build install
}

