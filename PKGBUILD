# Maintainer: Vignesh <vikits@gmail.com>

pkgname=oblige-obsidian-unstable # '-bzr', '-git', '-hg' or '-svn'
pkgver=v21.20231003 # Obsidian v21
pkgrel=1
pkgdesc="Random level generator for classic Doom, also a fork of OBLIGE. Stable branch."
arch=('any')
url="https://obsidian-level-maker.github.io"
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
source=('Obsidian::git+https://github.com/obsidian-level-maker/Obsidian#branch=unstable')
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/Obsidian"

	tag="$(git describe --tags --abbrev=0)"
	ver="$(echo $tag | cut -d'-' -f2)"
	stamp="$(echo $tag | cut -d'-' -f3)"
	echo "$ver.$stamp"
}

build() {
	cd "$srcdir/Obsidian"

	cmake -B build -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -DCMAKE_BUILD_TYPE=Release -DOBSIDIAN_INSTALL_STANDARD_LOCATION=ON
	cmake --build build
}

package() {
	cd "$srcdir/Obsidian"

	cmake --install build
}
