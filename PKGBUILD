# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-jupyter_telemetry
pkgver=0.0.3
pkgrel=1
pkgdesc="Configurable event-logging for Jupyter applications and extensions"
url="https://github.com/jupyter/telemetry"
arch=('any')
license=('BSD')
depends=('python-json-logger' 'python-jsonschema' 'python-ruamel-yaml' 'python-traitlets')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
source=(
  "git+https://github.com/jupyter/telemetry.git#tag=v$pkgver"
)
sha256sums=(
  'SKIP'
)

build() {
    cd "telemetry"
    python setup.py build
}

check() {
    cd "telemetry"
    PYTHONPATH="$PWD/build/lib:$PYTHONPATH" PYTHONDONTWRITEBYTECODE=1 pytest -v
}

package() {
    cd "telemetry"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
