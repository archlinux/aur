# OpenSPH package
# Maintainer: Pavel Sevecek <sevecek at sirrah.troja.mff.cuni.cz>

pkgname=opensph
pkgver=0.3.1
pkgrel=1
pkgdesc="Smoothed particle hydrodynamics library and visualization tools."
arch=('i686' 'x86_64')
url="https://gitlab.com/sevecekp/sph"
license=('MIT')
depends=('wxgtk2' 
         'intel-tbb'
         'eigen')
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
    qmake CONFIG+=release CONFIG+=use_tbb CONFIG+=use_eigen -spec linux-g++ ${srcdir}/sph/sph.pro
    make
}

package() {
    install -D build/cli/launcher/opensph-cli $pkgdir/usr/bin/opensph-cli
    install -D build/cli/info/opensph-info $pkgdir/usr/bin/opensph-info
    install -D build/gui/launcherGui/opensph $pkgdir/usr/bin/opensph
}

