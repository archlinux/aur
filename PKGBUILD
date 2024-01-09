# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=python-dt-schema
_name=${pkgname#python-}
pkgver=2023.11
pkgrel=1
pkgdesc="Tooling for devicetree validation using YAML and jsonschema"
arch=('any')
url="https://github.com/devicetree-org/dt-schema"
license=('BSD')
groups=()
depends=(
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
sha512sums=('81c19a5ebb883c46850e342734579a3b28e2e15116fd4578a3cdb44dc1a030676cb51c41cbb720fd24b697c328d56f3694ed9578944ebff5991eb795651328e4')

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
