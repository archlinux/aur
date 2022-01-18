# Contributor: Oscar Garcia Amor <ogarcia@connectical.com>
_commit='6ddc251fb0ba2f6dd0fbdd04a9560c6e22c0c011'
pkgname=python-itunes
pkgver=2017.10.28
pkgrel=1
pkgdesc="A simple python wrapper to access iTunes Store API"
arch=('any')
url="https://github.com/ocelma/${pkgname}"
license=(GPL)
makedepends=(python-setuptools)
source=(${url}/archive/${_commit}.tar.gz ${pkgname}.patch)
sha256sums=('5f9fa69dcaea47e532e5821552e7340d88724a980224b66e19d3d118d7e17ed1'
  'eec11f7a3be113af34c727efef293dfe57a9474aca3b46fa53a302804f08bc20')

prepare() {
  cp -r ${pkgname}-${_commit} ${pkgname}-${pkgver}
  # Fix python3 issue ${url}/issues/19
  patch -p0 <${pkgname}.patch
}

package() {
  cd ${pkgname}-${pkgver}
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
