# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=python-dt-schema
_name=${pkgname#python-}
pkgver=2024.09
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
sha512sums=('8f71065d667ce1c33e0cd42f8e429a4d1ea6020b3540f35b7b7e12e17649c696468561010886b55e1b5e30cc377f638c3d3296dbf9dc3ffb5d51137dc70f614e')

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
