# Contributor: mawcomw <mawcomw@gmail.com>
_base=dj-database-url
pkgname=python-${_base}
pkgver=0.5.0
pkgrel=0
arch=('i686' 'x86_64')
pkgdesc="Use Database URLs in your Django Application"
url="https://github.com/kennethreitz/${_base}"
license=('custom')
depends=(python)
makedepends=(python-setuptools)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('541d5177bff0fcc21372d2d9dc699ba11de1b1cabf10d61fb9f1e844a6dd4d46df5c7fdb6ccb4505cf984e41d7a2ae4e3af5e7d05072b0ed6982499eac5aac66')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE.txt
}
