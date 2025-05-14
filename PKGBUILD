# Maintainer: ResRipper <resripper@connective.link>

# shellcheck disable=SC2034,SC2148,SC2154

_name=loro
pkgname=python-loro
pkgver=1.5.0
pkgrel=1
pkgdesc="Python bindings for Loro CRDT"
arch=(any)
url='https://loro.dev/'
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
sha256sums=('8f2378608d32495e086157f37b1ae3bc747bedd1e49e9f41ade950ddced8641f')

build() {
    cd $_name-$pkgver || exit
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver || exit
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
