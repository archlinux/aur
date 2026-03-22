# Maintainer: DO3EET <do3eet@t-online.de>
pkgname=python-toybox-calc
_pkgname=toybox-calc
pkgver=0.0.2
pkgrel=1
pkgdesc="Comet HFJ-350M Toy Box configuration calculator"
arch=('any')
url="https://github.com/frankenstein91/Comet-HFJ-350M-Toy-Box"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/frankenstein91/Comet-HFJ-350M-Toy-Box/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2bb2fc103e0bd56ee5224d8aef1f8ae8d1be9fdbe5b761c9739a333cd5157a33')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # Install disclaimer as well
    install -Dm644 DISCLAIMER.md "$pkgdir/usr/share/doc/$pkgname/DISCLAIMER.md"
}
