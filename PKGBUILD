# Maintainer: maz-1 <loveayawaka@gmail.com>
_pkgname=deadbeef-qt5
pkgname=${_pkgname}-git
pkgver=90.56831d7
pkgrel=1
pkgdesc="Qt based user interface plugin for DeaDBeeF music player."
arch=('i686' 'x86_64')
url='https://github.com/maz-1/deadbeef-qt'
license=('GPL2')
depends=('qt5-base' 'deadbeef')
makedepends=('git' 'cmake' 'qt5-tools')
provides=('deadbeef-qt' 'deadbeef-qt-git')
conflicts=('deadbeef-qt' 'deadbeef-qt-git')
source=("git+https://github.com/maz-1/${_pkgname}.git")
install='deadbeef-qt5-git.install'
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
        mkdir -p "${srcdir}/build"
        cd "${srcdir}/build"
        cmake "${srcdir}/${_pkgname}" -DCMAKE_INSTALL_PREFIX="/usr"
        make clean && make 
}

package() {
        cd "${srcdir}/build" && make DESTDIR=$pkgdir install
}


