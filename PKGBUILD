# Maintainer: Leon Richardt <aur at leon.dev>
pkgname=python-repetita-parser
pkgver=2.0.0
pkgrel=1
pkgdesc="Python parser module for the REPETITA data format"
url="https://github.com/leon-richardt/python-repetita-parser"
license=("MIT")
arch=("any")

depends=(python python-numpy)
makedepends=(python-hatch python-tomli-w python-hatchling python-installer)
optdepends=("python-networkx: convert topologies to NetworkX graphs")
provides=(python-repetita-parser)

_name=${pkgname#python-}
_mod_name=${_name//-/_}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_mod_name-$pkgver.tar.gz")
sha256sums=('0c80c09cb66232c8bec829a23f5c95a05f6b269d8bf6966fa2168f7f6a867be6')

build() {
    cd "${srcdir}/$_mod_name-${pkgver}"
    hatch build -t wheel
}

package() {
    cd "${srcdir}/$_mod_name-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

check(){
    cd "$srcdir/$_mod_name-$pkgver"

    # For pytest
    hatch run test
}
