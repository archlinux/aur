# OpenSPH package
# Maintainer: Pavel Sevecek <sevecek at sirrah.troja.mff.cuni.cz>

pkgname=opensph
pkgver=0.1
pkgrel=1
pkgdesc="Smoothed particle hydrodynamics library and visualization tools."
arch=('i686' 'x86_64')
url="https://gitlab.com/sevecekp/sph"
license=('MIT')
depends=('wxgtk2' 
         'intel-tbb')
makedepends=('gcc>=7.0.0' 
             'qt5-base')
source=("git+https://gitlab.com/sevecekp/sph.git")
md5sums=('SKIP')

prepare() {
    cd "${srcdir}/sph"
    git checkout devel
}

build() {
    mkdir -p build
    cd build
    qmake CONFIG+=release -spec linux-g++ ${srcdir}/sph/sph.pro
    make
}

package() {
    install -D build/cli/launcher/launcher $pkgdir/usr/bin/opensph-cli
    install -D build/gui/launcherGui/launcherGui $pkgdir/usr/bin/opensph
}

