# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=python-dt-schema
_name=${pkgname#python-}
pkgver=2023.07
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
sha512sums=('7ba5a8ca07862093cbae3a0f539416811e5620164ef70aeecc1321a9d79db5c371b9a8b612ce0b30aea790fdf7830442f8e9e75592c2be07c8c456ffe709d0e3')

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
