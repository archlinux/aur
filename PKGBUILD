# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_base=python-anyconfig
pkgname=${_base}-git
pkgver=0.14.0.r148.ge44704fc
pkgrel=1
pkgdesc="Generic access to configuration files in any formats (to be in the future)"
url="https://github.com/ssato/${_base}"
arch=('any')
license=(MIT)
provides=("${_base}")
conflicts=("${_base}")
depends=('python' 'python-toml' 'python-ruamel-yaml' 'python-jinja' 'python-jmespath' 'python-jsonschema')
makedepends=('python-setuptools' git)
optdepends=(
  'python-simplejson: Replace standard json backend'
  'python-yaml: YAML support if ruamel.yaml is not aviliable'
  'python-anyconfig-bson-backend: BSON support using pymongo'
  'python-anyconfig-ion-backend: Amazon ion load and dump support'
  'python-anyconfig-cbor2-backend: CBOR support using cbor2'
  'python-anyconfig-configobj-backend: ConfigObj load and dump support'
  'python-anyconfig-msgpack-backend: MessagePack load and dump support'
  'python-anyconfig-json5-backend: Json5 load and dump support'
  'python-anyconfig-fortios-backend: Fortios load and parse support'
)
source=(${_base}::git+${url})
sha256sums=('SKIP')

pkgver() {
  cd ${_base}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/RELEASE_//'
}

build() {
  cd ${_base}
  python setup.py build
}

package() {
  cd ${_base}
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
