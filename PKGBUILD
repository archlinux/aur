# Maintainer: ResRipper <resripper@connective.link>

# shellcheck disable=SC2034,SC2148,SC2154

_name=loro
pkgname=python-loro
pkgver=1.10.0
pkgrel=1
pkgdesc="Python bindings for Loro CRDT"
arch=(any)
url='https://github.com/loro-dev/loro-py'
license=('MIT')
options=(!debug)

makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-hatch'

    'python-maturin'
)

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('0d205fee88e0373fb3dcbcdb224d0c2acabdf3fa0796e9af18ecbac699f98afb')

build() {
    cd $_name-$pkgver || exit
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver || exit
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
