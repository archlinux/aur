# Maintainer: Majorx234 <majorx234@gmail.com>

_pkgname=docling-parse
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=5.2.0
pkgrel=1
pkgdesc="Simple package to extract text with coordinates from programmatic PDFs"
arch=('any')
url="https://github.com/docling-project/docling-parse"
license=('MIT')
depends=(python-docling-core python-tabulate python-pillow python-pydantic)
makedepends=('python-build' 'python-installer' 'python-pdm-backend' 'python-wheel' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::https://github.com/docling-project/docling-parse/archive/refs/tags/v${pkgver}.tar.gz"
        "pyproject_toml_dep.patch")
sha256sums=('13be8a0d2089d0b8104de96b0b6b4affb8fc87d6004f53b4dc24cb18be839111'
            'SKIP')

prepare() {
    patch -Np0 < pyproject_toml_dep.patch
}

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
