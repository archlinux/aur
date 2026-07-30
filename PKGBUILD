# Maintainer: Cyril <cyrwae[at]hotmail[dot]com>
pkgname=python-pygrister
_name=${pkgname#python-}
pkgver=0.10.0
pkgrel=1
pkgdesc="A Python client for the Grist API."
arch=('any')
url="https://github.com/ricpol/pygrister"
license=('MIT')
depends=(python-requests python-typer)
makedepends=(python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=(d3939cad7ddcd64acfcab8597e57026103e791df636d41a102bb75069abfbbf7)

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
