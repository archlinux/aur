# Maintainer: Kyle Coffey <me@phytolizer.dev>
# Maintainer: Gustavo Rehermann <rehermann6046@gmail.com>

pkgname=oblige-obsidian-stable-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=20.20230516.r13.g6cbf2c3 # Obsidian v20
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
source=('Obsidian::git+https://github.com/obsidian-level-maker/Obsidian#branch=obsidian')
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/Obsidian"

	git describe --tags --abbrev=7 | sed 's/^Obsidian-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
