# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=sherpa
pkgver=3.0.0
pkgrel=1
pkgdesc="A particle physics package for Monte Carlo simulation of collider events."
arch=('x86_64' 'i686')
url="https://sherpa-team.gitlab.io/"
license=('GPL3')
depends=('lhapdf' 'fastjet' 'hepmc' 'hepmc2' 'openmpi' 'openloops' 'rivet' 'root' 'pythia8')
source=(https://gitlab.com/sherpa-team/sherpa/-/archive/v3.0.0/sherpa-v$pkgver.tar.gz)
md5sums=('70f2251d4ba614623a395f1ce3a8384d')

build() {
    cd "$srcdir/sherpa-v$pkgver"
    cmake -S . -B . -DSHERPA_ENABLE_HEPMC3=ON -DSHERPA_ENABLE_HEPMC3_ROOT=ON -DSHERPA_ENABLE_MPI=ON -DSHERPA_ENABLE_OPENLOOPS=ON -DSHERPA_ENABLE_PYTHIA8=ON -DSHERPA_ENABLE_PYTHON=ON -DSHERPA_ENABLE_RIVET=ON -DSHERPA_ENABLE_ROOT=ON -DSHERPA_ENABLE_UFO=ON -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/sherpa-v$pkgver"
    make DESTDIR="$pkgdir" install
    for i in init_nlo.sh plot_stats.sh; do
        mv $pkgdir/usr/bin/$i $pkgdir/usr/share/SHERPA-MC/
    done
    rm -rf $pkgdir/usr/share/SHERPA-MC/Examples/Makefile $pkgdir/usr/share/SHERPA-MC/Examples/cmake_install.cmake $pkgdir/usr/share/SHERPA-MC/Examples/CMakeFiles/CMakeDirectoryInformation.cmake
}
