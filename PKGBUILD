# Maintainer: ResRipper <resripper@connective.link>

# shellcheck disable=SC2034,SC2148,SC2154

_name=loro
pkgname=python-loro
pkgver=1.5.4
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
sha256sums=('bc2d522e4c02922cad65ef5df6dd4e1fe55ddfad3ae7b5f1754f356ccf42f639')

build() {
    cd $_name-$pkgver || exit
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver || exit
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
