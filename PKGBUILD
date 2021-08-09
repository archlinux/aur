# Maintainer: Sean Anderson <seanga2@gmail.com>
pkgname=python-dt-schema
_name=${pkgname#python-}
pkgver=2021.02
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
sha512sums=('2db786f9567cdec3756e58819ef37bebf3db3fec34cc449bd38f100d397f50669c67eb0bd724327f0582b766786e6c8be0b414fda170dd4a16242b28616f77b0')

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
