# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=python-dt-schema
_name=${pkgname#python-}
pkgver=2025.06.1
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
sha512sums=('e6c8d7eeb34f416a0baaec700c04684603f1486f9e9ffa39a01ff56a35656adc154294a3144080a69d1a536dc3f05ab04e7c2a724068638371f153550af3441e')

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
