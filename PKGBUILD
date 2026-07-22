# First maintainer: Sean Anderson <seanga2@gmail.com>
# Actual maintainer: Raphaël Gallais-Pou <rgallaispou@gmail.com>
pkgname=python-dt-schema
_name=${pkgname#python-}
pkgver=2026.06
pkgrel=1
pkgdesc="Tooling for devicetree validation using YAML and jsonschema"
arch=('any')
url="https://github.com/devicetree-org/dt-schema"
license=('BSD')
groups=()
depends=(
    dtc
    python
    python-ruamel-yaml
    python-rfc3987
    python-jsonschema
)
makedepends=(
    python-build
    python-installer
    python-setuptools-scm
    python-wheel
)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/devicetree-org/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('5a4bb497d8f45aeeaaa46ea08ea61e3afe5a1ee62dc8ee610dbcaa438e7ab43d7e942aeac1d7f5cdd02c6557711fa0afab651ef3b81042772f74ed5378b397d3')

prepare() {
    cd "$_name-$pkgver"
    sed -i "/write_to.*/a fallback_version = '${pkgver}'" pyproject.toml
}

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
