# Maintainer: xgdgsc <xgdgsc at gmail dot com>

_pkgname=somoclu
pkgname=${_pkgname}
pkgver=1.5
pkgrel=1
pkgdesc="Massively parallel self-organizing maps: accelerate training on multicore CPUs, GPUs, and clusters"
arch=('i686' 'x86_64')
url="https://github.com/peterwittek/somoclu"
license=('GPL3')
depends=()
optdepends=(
  'cuda: cuda support'
  'openmpi: mpi support'
)
#makedepends=('git')
#provides=("$_pkgname")
#onflicts=("$_pkgname")
#replaces=("$_pkgname")
#install="${pkgname}.install"

source=("https://github.com/peterwittek/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('46792f680c1d1836c8c6f61dbf882a534f4d92318f944e2949ffaad58298f4c202dd2857e32a1905ec77f04e5bec6a69213ebd9ed0086e6cac38f0c2dee7e586')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    sed -i "s,/dev/null,/dev/null || :," autogen.sh
    ./autogen.sh
    ./configure --prefix="/usr"
    make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
