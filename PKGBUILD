# Maintainer: Ewan Green <ewangreen95 at gmail dot com>
# Contributor: JP Cimalando <jp-dev at inbox dot ru>
pkgname=ptcollab-git
_pkgname=ptcollab
pkgver=latest
pkgrel=2
pkgdesc="Multiplayer music editor"
arch=('x86_64' 'aarch64')
url="https://yuxshao.github.io/ptcollab/"
license=('MIT')
depends=('qt5-base' 'rtmidi')
makedepends=('git' 'qt5-tools' 'qt5-multimedia' 'libogg' 'libvorbis')
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/yuxshao/ptcollab.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "$_pkgname"
	qmake ptcollab.pro CONFIG+=release PREFIX=/usr QMAKE_CXXFLAGS+='-D_GLIBCXX_ASSERTIONS=0'
	make -j$(expr `nproc` - `nproc` / 2) qmake_all
	 make
}

package() {
	cd "$_pkgname"
	make INSTALL_ROOT="$pkgdir" install
}
