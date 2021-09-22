#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Gardar <aur@gardar.net>
# Contributor: Morten Linderud <morten@linderud.pw>

pkgname=python-anyconfig
_name=anyconfig
pkgver=0.12.0
pkgrel=1
pkgdesc='Python library provides common APIs to load and dump configuration files in various formats'
url='https://github.com/ssato/python-anyconfig'
arch=('any')
license=('MIT')
depends=(
    'python-toml'
    'python-ruamel-yaml'
    'python-jinja'
    'python-jmespath'
    'python-jsonschema'
)
optdepends=(
    'python-simplejson: Replace standard json backend'
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
b2sums=('db78a5530e1f0bce222482e5b1b92ee67bc0e3e53b9446e2abd127d6c4afd8b2e3501faca88f6f407d95f4cf5792aec126d659ac98a033661daaa4b04779d031')

build() {
    cd "$srcdir/$_name-$pkgver" || exit
    export PYTHONHASHSEED=0
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver" || exit
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
