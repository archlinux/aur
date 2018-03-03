# Maintainer: xgdgsc <xgdgsc at gmail dot com>

_pkgname=somoclu
pkgname=${_pkgname}
pkgver=1.7.5
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
sha512sums=('1245231fb6f216e8704334c895d11ae71cf5b48e6960f33bf93c93a49fa88c5806a2fb4555b513d5ca18951dcbd3285c0f7876f3839114e11b9c8fa360ea926c')

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
