# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

_commit='6ddc251fb0ba2f6dd0fbdd04a9560c6e22c0c011'
pkgbase=python-itunes
pkgname=('python-itunes' 'python2-itunes')
pkgver=2017.10.28
pkgrel=1
pkgdesc='A simple python wrapper to access iTunes Store API'
arch=('any')
url='https://github.com/ocelma/python-itunes'
license=('GPL')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/ocelma/python-itunes/archive/${_commit}.tar.gz"
        "python-itunes.patch")
sha256sums=('5f9fa69dcaea47e532e5821552e7340d88724a980224b66e19d3d118d7e17ed1'
            'eec11f7a3be113af34c727efef293dfe57a9474aca3b46fa53a302804f08bc20')

prepare() {
  cp -r python-itunes-${_commit} python-itunes-${pkgver}
  cp -r python-itunes-${_commit} python2-itunes-${pkgver}

  # Fix python3 issue https://github.com/ocelma/python-itunes/issues/19
  patch -p0 <python-itunes.patch
}

package_python-itunes() {
  cd python-itunes-${pkgver}

  python setup.py install --root="${pkgdir}" --optimize='1'
}

package_python2-itunes() {
  cd python2-itunes-${pkgver}

  python2 setup.py install --root="${pkgdir}" --optimize='1'
}
