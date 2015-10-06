# Maintainer: maz-1 <loveayawaka@gmail.com>
pkgname=deadbeef-qt
pkgver=7.3710be0
pkgrel=1
pkgdesc="Qt based user interface plugin for DeaDBeeF music player."
arch=('i686' 'x86_64')
url='https://bitbucket.org/tonn/deadbeef-qt/wiki/Home'
license=('GPL2')
depends=('qt4' 'deadbeef')
makedepends=('cmake' 'mercurial')
source=("git+https://github.com/maz-1/deadbeef-qt.git")
install='deadbeef-qt.install'
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
        mkdir -p "${srcdir}/build"
        cd "${srcdir}/build"
        cmake "${srcdir}/${pkgname}" -DCMAKE_INSTALL_PREFIX="/usr" -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
        make clean && make 
}

package() {
        cd "${srcdir}/build" && make DESTDIR=$pkgdir install
}


