# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Mario Blättermann <mario.blaettermann@gmail.com>
pkgname=glabels-qt-git
pkgver=r463.e0b9eeb
pkgrel=1
pkgdesc="Development version of the next major version of gLabels (4.0)."
arch=('x86_64')
url="https://github.com/jimevins/glabels-qt"
license=('GPL3')
groups=()
depends=('qt5-base' 'qt5-translations')
makedepends=('qt5-tools' 'git' 'cmake' 'zint')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/jimevins/glabels-qt.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cd build
	make DESTDIR="$pkgdir/" install
}
