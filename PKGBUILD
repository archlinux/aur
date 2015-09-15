# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sylvain HENRY <hsyl20@yahoo.fr>

set -u
_relno='34521'
pkgname='knem'
pkgver='1.1.2'
pkgrel='1'
pkgdesc='High-Performance Intra-Node MPI Communication'
arch=('any')
url='http://knem.gforge.inria.fr'
license=('bsd')
depends=('hwloc')
makedepends=('make')
install=('knem.install')
_verwatch=("${url}/download/" "http://gforge.inria.fr/frs/download.php/[0-9]\+/${pkgname}-\([0-9\.]\+\)\.tar\.gz" 'l')
#source=(http://runtime.bordeaux.inria.fr/knem/download/knem-${pkgver}.tar.gz)
source=("http://gforge.inria.fr/frs/download.php/${_relno}/knem-${pkgver}.tar.gz")
sha256sums=('4523ec59b15bd69db7956372d31e5cb8054627673a41154530310e9c4b8ea13e')

prepare() {
  set -u
  cd "${pkgname}-"*/
  ./configure --prefix='/opt/knem'
  set +u
}

build() {
  set -u
  cd "${pkgname}-"*/
  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${pkgname}-"*/
  make install DESTDIR="${pkgdir}"
  set +u
}
set +u
