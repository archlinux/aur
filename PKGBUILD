# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=python-dt-schema
_name=${pkgname#python-}
pkgver=2022.05
pkgrel=1
pkgdesc="Tooling for devicetree validation using YAML and jsonschema"
arch=('any')
url="https://github.com/devicetree-org/dt-schema"
license=('BSD')
groups=()
depends=('python' 'python-ruamel-yaml' 'python-rfc3987' 'python-jsonschema')
makedepends=('python-setuptools' 'python-pip')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/devicetree-org/$_name/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('88b2d40c66cc7b3332f7229166121203e5b8d2ac32ef308e73af83b50aa76471dcd48d1e8f6ff77b80dec439645a109e582f9e7b43b0d3049d5ff6a0b79a108b')

prepare() {
    cd "$_name-$pkgver"
    sed -i "s/\(use_scm_version={\)/\1'fallback_version':'${pkgver}',/g" setup.py
}

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
