# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=python-dt-schema
_name=${pkgname#python-}
pkgver=2020.08.1
pkgrel=1
pkgdesc="Tooling for devicetree validation using YAML and jsonschema"
arch=('any')
url="https://github.com/devicetree-org/dt-schema"
license=('BSD')
groups=()
depends=('python' 'python-ruamel-yaml' 'python-rfc3987' 'python-jsonschema')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://github.com/devicetree-org/$_name/archive/v$pkgver.tar.gz")
sha512sums=('b3fd014837a207b2bca855ba04892a094b72de7c55d0f321a42dd53273262dc9b3a5b41b7e67a712adb10ba007bb19638e98500f0cbe3abec5b5b911786e2e30')

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
