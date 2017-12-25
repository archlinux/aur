# Maintainer: rebel <novakpetya at yahoo dot co dot uk>

pkgname=doublecmd-qt5-svn
pkgver=0.9
pkgrel=2
pkgdesc="twin-panel (commander-style) file manager (QT5)"
arch=(x86_64)
url=https://doublecmd.sourceforge.io/
license=(GPL2)
conflicts=(doublecmd doublecmd-qt doublecmd-qt5)
depends=(qt5-base qt5-x11extras qt5-webkit qt5pas)
makedepends=(subversion fpc lazarus-svn)
source=("$pkgname::svn+https://svn.code.sf.net/p/doublecmd/code/trunk")

build() {
	cd $pkgname
        sed -i -- 's/=$(which lazbuild)/="$(which lazbuild) --lazarusdir=\/usr\/lib\/lazarus"/' build.sh
        sed -i -- 's/LIB_SUFFIX=64/LIB_SUFFIX=/' install/linux/install.sh
	lcl=qt5 ./build.sh beta
}

package() {
	cd $pkgname
        install/linux/install.sh --install-prefix="${pkgdir}"
}
sha256sums=('SKIP')
