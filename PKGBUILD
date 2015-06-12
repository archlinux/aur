# Maintainer: xgdgsc <xgdgsc at gmail dot com>

_pkgname=somoclu
pkgname=${_pkgname}
pkgver=1.4.1
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
sha512sums=('23691b27c75d78854a4a37dad47f9b8f85102c597919559c1d2315e14650e1e38aeb18c0be11a96a9bba31d27e0995359af03b3a1140271c63531f692b41ff6e')

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
