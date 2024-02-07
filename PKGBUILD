# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=shvspy-git
_gitname=shvspy
pkgver=r432.fa91bbe
pkgrel=1
pkgdesc='Qt GUI tool for shvbroker administration and browsing'
url='https://github.com/silicon-heaven/shvspy'
arch=('i686' 'x86_64' 'armv7h')
license=('LGPL3')
depends=('necrolog' 'libshv' 'glibc' 'gcc-libs' 'qt6-base' 'qt6-networkauth' 'qt6-svg')
makedepends=('git' 'cmake')
conflicts=('shvspy' 'shvspy-git')
provides=('shvspy')
source=('git+https://github.com/silicon-heaven/shvspy.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -S "$srcdir/$_gitname" -B "$srcdir/build" \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DSHVSPY_USE_LOCAL_NECROLOG=ON \
	-DSHVSPY_USE_LOCAL_LIBSHV=ON \
	-DUSE_QT6=ON

	cmake --build "$srcdir/build"
}

package() {
	DESTDIR="$pkgdir" cmake --install "$srcdir/build"
}
