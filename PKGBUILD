# Maintainer: Gustavo Rehermann <rehermann6046@gmail.com>

pkgname=oblige-obsidian-stable-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r18534.34f77453d # Obsidian Beta 19? Clearly a later commit than that.
pkgrel=1
pkgdesc="Random level generator for classic Doom, also a fork of OBLIGE. Stable branch."
arch=('any')
url="https://forum.zdoom.org/viewtopic.php?t=71457"
license=('GPL')
groups=()
depends=('libx11' 'fltk')
makedepends=('git' 'cmake')
provides=("oblige-obsidian")
conflicts=("oblige-obsidian")
replaces=()
backup=()
options=()
install=
source=('obsidian::git+https://github.com/dashodanger/Obsidian#branch=obsidian')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/obsidian"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/obsidian"
	
    if [[ ! -d build ]]; then
         mkdir build
    fi

    cd build

	if which ninja >/dev/null; then
	    cmake .. -G Ninja
	else
	    cmake ..
	fi

	if which ninja >/dev/null; then ninja; else make; fi
}

package() {
	cd "$srcdir/obsidian/build"

	DESTDIR="$pkgdir/" cmake --install .
}
