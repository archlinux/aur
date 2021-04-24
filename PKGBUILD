# Maintainer: pumpkincheshire <sollyonzou@gmail.com>
# Contributor: Gardar <aur@gardar.net>
# Contributor: Morten Linderud <morten@linderud.pw>

pkgname=python-anyconfig
_name=anyconfig
pkgver=0.10.1
pkgrel=1
pkgdesc='Python library provides common APIs to load and dump configuration files in various formats'
url='https://github.com/ssato/python-anyconfig'
arch=('any')
license=('MIT')
depends=('python-toml' 'python-ruamel-yaml' 'python-jinja' 'python-jmespath' 'python-jsonschema')
optdepends=('python-simplejson: Replace standard json backend'
    'python-yaml: YAML support if ruamel.yaml is not aviliable'
    'python-anyconfig-bson-backend: BSON support using pymongo'
    'python-anyconfig-ion-backend: Amazon ion load and dump support'
    'python-anyconfig-cbor-backend: CBOR support using cbor'
    'python-anyconfig-cbor2-backend: CBOR support using cbor2'
    'python-anyconfig-configobj-backend: ConfigObj load and dump support'
    'python-anyconfig-msgpack-backend: MessagePack load and dump support'
    'python-anyconfig-json5-backend: Json5 load and dump support'
    'python-anyconfig-fortios-backend: Fortios load and parse support'
)
makedepends=('python-setuptools')
conflicts=('python-anyconfig-git')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('f04a5490da8563c97fad15810b0debc92351dbd4b8058dfd82d32a30a41e7e5c')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
