# Maintainer: taotieren <admin@taotieren.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=chroma-hnswlib
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.8.2
pkgrel=1
pkgdesc="Chroma's fork of hnswlib - a header-only C++/python library for fast approximate nearest neighbors"
arch=($CARCH)
url="https://github.com/chroma-core/hnswlib"
provides=("python-hnswlib")
conflicts=("python-hnswlib")
license=('Apache-2.0')
depends=(
    glibc
    libgcc
    libstdc++
)
makedepends=(
    'git'
    'pybind11' 
    'python-numpy'
    'python-build' 
    'python-installer' 
    'python-setuptools' 
    'python-wheel'
)
source=("${_pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('afe025adc97dca7ab99fdd1dbe482ec4f0a1ed2e52adcc85af255554dbc73dea')
prepare() {
    git -C "${srcdir}/${_pkgname}" clean -dfx  
}

build() {
    cd "${srcdir}/${_pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
