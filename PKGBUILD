# Maintainer: Leon Richardt <aur at leon.dev>
pkgname=python-repetita-parser
pkgver=3.0.0
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
sha256sums=('19b7a7a08ef636ee742b876dd146075c7659750c0f6659973599c29e3a72635c')

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
