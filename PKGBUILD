# Maintainer: a821 at (nospam) mail de
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Gardar <aur@gardar.net>
# Contributor: Morten Linderud <morten@linderud.pw>

pkgname=python-anyconfig
_name=anyconfig
pkgver=0.14.0
pkgrel=2
pkgdesc='Provides common APIs to load and dump configuration files in various formats'
url='https://github.com/ssato/python-anyconfig'
arch=('any')
license=('MIT')
depends=(
    'python-toml'
    'python-ruamel-yaml'
    'python-jinja'
    'python-jmespath'
    'python-jsonschema'
    'python-simplejson'
    'python-yaml'
)
optdepends=(
    'python-anyconfig-bson-backend: BSON support using pymongo'
    'python-anyconfig-ion-backend: Amazon ion load and dump support'
    'python-anyconfig-cbor2-backend: CBOR support using cbor2'
    'python-anyconfig-configobj-backend: ConfigObj load and dump support'
    'python-anyconfig-msgpack-backend: MessagePack load and dump support'
    'python-anyconfig-json5-backend: Json5 load and dump support'
    'python-anyconfig-fortios-backend: Fortios load and parse support'
)
makedepends=(
    'python-setuptools'
    'python-build'
    'python-installer'
    'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('1f30b21066b5cf06784d96047d63baf7647db7612f6dff10a50917a980f8366eda3f7c253762f00133e82cee25d5632655ac0658aadbce629b53b727c766014b')

prepare() {
    cd "$_name-$pkgver"
    sed -i -e '1,3d' -e '/License ::/d' setup.cfg
}

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: set ts=4 sw=4 et:
