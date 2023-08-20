# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=python-dt-schema
_name=${pkgname#python-}
pkgver=2022.08.1
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
sha512sums=('61ac6d52ca7b604ea94fc396a52450d24767c3ad5d25fa3f7fab0fb732e57af5604403cd7596f49d60918313e9bc22eabcd1f67a8e3cbdda5f0e7d449c50c731')

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
