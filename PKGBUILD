# OpenSPH package
# Maintainer: Pavel Sevecek <sevecek at sirrah.troja.mff.cuni.cz>

pkgname=opensph
pkgver=0.3.8
pkgrel=1
pkgdesc="Smoothed particle hydrodynamics library and visualization tools."
arch=('i686' 'x86_64')
url="https://gitlab.com/sevecekp/sph"
license=('MIT')
depends=('wxgtk2' 
         'intel-tbb'
         'eigen'
         'chaiscript')
makedepends=('gcc>=7.0.0' 
             'cmake')
source=("git+https://gitlab.com/sevecekp/sph.git")
md5sums=('SKIP')

prepare() {
    cd "${srcdir}/sph"
    git checkout devel
}

build() {
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DWITH_TBB=ON \
          -DWITH_EIGEN=ON \
          -DWITH_CHAISCRIPT=ON \
          ${srcdir}/sph
    make
}

package() {
    install -D build/cli/launcher/opensph-cli $pkgdir/usr/bin/opensph-cli
    install -D build/cli/info/opensph-info $pkgdir/usr/bin/opensph-info
    install -D build/gui/launcherGui/opensph $pkgdir/usr/bin/opensph
}

