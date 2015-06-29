# Contributor: marcotangaro <marco_tangaro@hotmail.com>
# Contributor: Denis Falqueto <denisfalqueto@gmail.com>

pkgname=kdeplasma-applets-fancytasks
pkgver=1.1.2
pkgrel=3
pkgdesc="Plasmoid providing fancy visualization of tasks, launchers and jobs for those who need full power of task manager and fresh look"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/Fancy+Tasks?content=99737"
license=('GPL')
depends=('kdebase-workspace')
conflicts=('fancytasks-plasmoid')
makedepends=('cmake' 'automoc4' 'kdebase-lib')
source=(https://opendesktop.org/CONTENT/content-files/99737-fancytasks-$pkgver.tar.bz2)
md5sums=('0ffe30331739972d88126dd828c0ea22')

build() {
	cd "$srcdir/fancytasks-${pkgver}"
	[[ -d build ]] && rm -fR build
        mkdir build
        cd build
	cmake ../ -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DQT_QMAKE_EXECUTABLE=qmake-qt4
	make
}

package() {
	cd "$srcdir/fancytasks-${pkgver}/build"
        make DESTDIR="$pkgdir" install
}
