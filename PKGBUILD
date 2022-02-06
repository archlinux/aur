# Contributor: jyantis <yantis@yantis.net>
_base=nameparser
pkgname=python-${_base}
pkgver=1.1.1
pkgrel=1
pkgdesc="A simple Python module for parsing human names into their individual components"
arch=(any)
url="https://github.com/derek73/${pkgname}"
license=(LGPL2)
depends=(python)
makedepends=(python-setuptools)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d675ee39b4dec6bba59c0f246d41ec9edf939979025298643696b26987dc59f93cf8c996efb62054be4324f02b7d5461e48918b58d7333e37968bcae31c8fdbb')

build() {
  cd ${pkgname}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

check() {
  cd ${pkgname}-${pkgver}
  python setup.py test
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst "${pkgdir}/usr/share/doc/${pkgname}"
}
