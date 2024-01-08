# Maintainer: Victor Bonnelle <victor.bonnelle@proton.me>

pkgname=jinja2-cli
pkgver=0.8.2
pkgrel=4
pkgdesc="CLI for Jinja2"
url="https://github.com/mattrobenolt/jinja2-cli"
license=('BSD')
arch=('any')
depends=('python' 'python-jinja')
makedepends=('python-setuptools' 'python-build' 'python-installer')
checkdepends=('python-pytest')
optdepends=(
    'python-yaml: YAML support'
    'python-toml: TOML support'
    'python-xmltodict: XML support'
    'python-hjson: HJSON support'
    'python-json5: JSON5 support'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/mattrobenolt/jinja2-cli/archive/${pkgver}.tar.gz"
)
sha512sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname-$pkgver"
    PYTHONPATH="build/lib" pytest
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
