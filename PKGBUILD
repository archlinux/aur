# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-jupyter_telemetry
pkgver=0.1.0
pkgrel=1
pkgdesc="Configurable event-logging for Jupyter applications and extensions"
url="https://github.com/jupyter/telemetry"
arch=('any')
license=('BSD')
depends=('python-json-logger' 'python-jsonschema' 'python-ruamel-yaml' 'python-traitlets')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(
  "https://files.pythonhosted.org/packages/source/j/jupyter_telemetry/jupyter_telemetry-$pkgver.tar.gz"
)
sha256sums=(
  '445c613ae3df70d255fe3de202f936bba8b77b4055c43207edf22468ac875314'
)

build() {
    cd "jupyter_telemetry-$pkgver"
    python setup.py build
}

check() {
    cd "jupyter_telemetry-$pkgver"
    PYTHONPATH="$PWD/build/lib:$PYTHONPATH" PYTHONDONTWRITEBYTECODE=1 pytest -v
}

package() {
    cd "jupyter_telemetry-$pkgver"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
