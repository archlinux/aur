# First maintainer: Sean Anderson <seanga2@gmail.com>
# Actual maintainer: Raphaël Gallais-Pou <rgallaispou@gmail.com>
pkgname=python-dt-schema
_name=${pkgname#python-}
pkgver=2026.09
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
sha512sums=('2be2f5cc9d27635d53669a667348c2b33e6599a680e85f190bc1891af1ddd765bc1f0c25fb85cf91cc11cfa8c2873d2e89aab9a67eaa465b3223befbceb382b7')

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
