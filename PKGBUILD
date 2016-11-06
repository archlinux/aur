# Maintainer: xgdgsc <xgdgsc at gmail dot com>

_pkgname=somoclu
pkgname=${_pkgname}
pkgver=1.7.1
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
sha512sums=('d49394c12f38e846bb3cbad635d482b255d09bd1abbbc2a3184a92c8aadb03674cc84f37cf130584c98289fbf49b4026b9bd4b60df2a07221aedbb000362dc1c')

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
