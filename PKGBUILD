# Maintainer: Dylan Delgado <dylan1496@live.com>
pkgname=sherpa-git
pkgver=3.0.0beta1.r27.g61117dc90
pkgrel=1
pkgdesc="A particle physics package for Monte Carlo simulation of collider events - git version"
arch=('x86_64' 'i686')
url="http://sherpa.hepforge.org"
conflicts=('sherpa')
provides=('sherpa')
license=('GPL3')
depends=('lhapdf' 'fastjet' 'hepmc' 'hepmc2' 'openmpi' 'openloops' 'rivet')
source=('git+https://gitlab.com/sherpa-team/sherpa.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/sherpa"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/sherpa"
    cmake -B build -S "$srcdir/sherpa" -DCMAKE_INSTALL_PREFIX=/usr -DSHERPA_ENABLE_THREADING=ON -DSHERPA_ENABLE_OPENLOOPS=ON -DSHERPA_ENABLE_MPI=ON -DSHERPA_ENABLE_HEPMC3=ON -DSHERPA_ENABLE_HEPMC2=ON -DSHERPA_ENABLE_RIVET=ON
    cmake --build build
}

package() {
	cd "$srcdir/sherpa"
        DESTDIR="$pkgdir" cmake --install build
}
