# Maintainer: peippo <christoph.fink@gmail.com>
# Contributor: Gesh <gesh@gesh.uni.cx>

pkgname=python-types-tqdm
_name=${pkgname#python-}
_name=${_name//-/_}
pkgdesc="Typing stubs for tqdm"
url="https://github.com/python/typeshed"

pkgver=4.67.0.20250809
pkgrel=2

arch=("any")
license=("Apache-2.0")

depends=(
    "python"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
b2sums=("f0a261cd7c0c4b3efe4e96984e9bf53c40947129ca88da56a06c0cb6631184f8a8165fee206f2000b44a50a2db3e1654b696ef5474dbc37351c4dec19a5a106c")

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
