# Maintainer: xgdgsc <xgdgsc at gmail dot com>

_pkgname=somoclu
pkgname=${_pkgname}
pkgver=1.7.0
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
sha512sums=('77005e7ea590e66fd9bdb6a8c2d174da0460b788fef53cea52ec0eeb5799dd461d78f59cb44abde7f814955cf42d4b9843a0cacb3a25b7f6e33c35a53b3c5018')

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
