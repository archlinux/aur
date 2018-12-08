# Contributor: MCMic <come.bernigaud@laposte.net>
# Contributor: Cravix (AUR)
# Maintainer: SanskritFritz

pkgname=meandmyshadow-git
_gitname=meandmyshadow
pkgver=v0.5.beta.r213.ga82cbf0
pkgrel=1
pkgdesc="Puzzle/platform game in which you try to reach the exit by solving puzzles. Forked by Jz Pan (acmepjz)."
arch=('i686' 'x86_64')
url="https://github.com/acmepjz/meandmyshadow"
license=('GPL3')
depends=('sdl2_gfx' 'sdl2_image' 'sdl2_ttf' 'sdl2_mixer' 'curl' 'libarchive' 'hicolor-icon-theme' 'libgl')
makedepends=('make' 'cmake' 'git')
provides=("meandmyshadow")
conflicts=("meandmyshadow")
source=("git+https://github.com/acmepjz/meandmyshadow.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$_gitname"
	sed -i 's|Find_Package (Lua REQUIRED)|Find_Package (Lua 5.2 EXACT REQUIRED)|' CMakeLists.txt
}

build() {
  cd "$_gitname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$_gitname"
  make install DESTDIR=${pkgdir}
}

