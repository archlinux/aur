# Maintainer: a821 at (nospam) mail de
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Gardar <aur@gardar.net>
# Contributor: Morten Linderud <morten@linderud.pw>

pkgname=python-anyconfig
_name=anyconfig
pkgver=0.16.0
pkgrel=1
pkgdesc='Provides common APIs to load and dump configuration files in various formats'
url='https://github.com/ssato/python-anyconfig'
arch=('any')
license=('MIT')
depends=('python')
optdepends=(
    'python-anyconfig-bson-backend: BSON support using pymongo'
    'python-anyconfig-ion-backend: Amazon ion load and dump support'
    'python-anyconfig-cbor2-backend: CBOR support using cbor2'
    'python-anyconfig-configobj-backend: ConfigObj load and dump support'
    'python-anyconfig-msgpack-backend: MessagePack load and dump support'
    'python-anyconfig-json5-backend: Json5 load and dump support'
    'python-anyconfig-fortios-backend: Fortios load and parse support'
    'python-jinja: Template support'
    'python-jmespath: Query with JMESpath expression support'
    'python-jsonschema: JSON schema support'
    'python-tomli: TOML support (parser)'
    'python-tomli-w: TOML support (writer)'
    'python-typing_extensions: type validation'
    'python-yaml: YAML support'
)
makedepends=(
    'python-setuptools'
    'python-build'
    'python-installer'
    'python-wheel'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('6c98a0a0a5f53dfb5d4af88274e856f25f3f635b9fb2e02c6a6b6b0510f9d2b0dd3c1e7bf6704df3cae277309a079dec68cc48c0756f2365f985ee9442e92b56')

prepare() {
    cd "$_name-$pkgver"
    # it doesn't exist in the AUR and it doesn't seem it's needed for building
    sed -i '/tox-uv/d' pyproject.toml
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
