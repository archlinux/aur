# Maintainer:  gagnonlg NOSPAM protonmail NOSPAM com
# See also: https://github.com/paulgessinger/dd4hep-aur
pkgname=dd4hep
_pkgver=01-15
pkgver=$(echo $_pkgver | sed 's/-/./')
pkgrel=2
pkgdesc="Detector Description Toolkit for High Energy Physics"
arch=('x86_64')
url="https://dd4hep.web.cern.ch/dd4hep/"
license=('LGPL3')
depends=('xerces-c'
	 'geant4>=10.2.2'
	 'root>=6.08'
	 'boost-libs>=1.49'
	 'intel-tbb'
	 'cern-vdt'
        )
makedepends=('boost>=1.49' 'cmake>=3.12')
source=(https://github.com/AIDASoft/$pkgname/archive/v$_pkgver.tar.gz)
md5sums=('6e28f8ddc798522ede04644fc45209bb')

build() {
  cd "$srcdir/DD4hep-$_pkgver"
  mkdir -p build && cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=Release \
	-DDD4HEP_USE_GEANT4=ON \
	-DCMAKE_CXX_STANDARD=17 \
	..

  make
}

package() {
  cd "$srcdir/DD4hep-$_pkgver/build"

  make DESTDIR="${pkgdir}" install
}
