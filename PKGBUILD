# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=hepmc3
pkgver=3.2.1
pkgrel=2
pkgdesc="A particle physics package for storing collision events from Monte Carlo generators."
arch=('x86_64' 'i686')
url="http://hepmc.web.cern.ch/hepmc/"
license=('GPL3')
makedepends=('cmake')
optdepends=('root: ROOT I/O support')
source=("https://hepmc.web.cern.ch/hepmc/releases/HepMC3-${pkgver}.tar.gz" "https://gitlab.cern.ch/hepmc/HepMC3/-/commit/ba38f14d8f56c16cc4105d98f6d4540c928c6150.diff")
noextract=()
md5sums=('8cc6cc4f13fdf8be9ed677924daea250'
         'd8635566838595ff7d5884f0294bb960')

build() {
        cd "$srcdir/HepMC3-$pkgver"
        patch -p1 < ../ba38f14d8f56c16cc4105d98f6d4540c928c6150.diff
        mkdir -p build
        cd build
        cmake ../ -DROOT_DIR=/usr -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
        make
}

package() {
        cd "$srcdir/HepMC3-$pkgver"
        cd build
	make DESTDIR="$pkgdir/" install
}
