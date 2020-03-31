# Maintainer: Fernando Ortiz <nandub+arch@nandub.info>

pkgbase=python-ck
pkgname=('python-ck' 'python2-ck')
_name=ck
pkgver=1.12.3
pkgrel=5
pkgdesc='Collective Knowledge - lightweight knowledge manager to organize, cross-link, share and reuse artifacts and workflows'
arch=('any')
url='https://github.com/ctuning/ck'
license=('BSD 3-clause')
makedepends=('python-setuptools' 'python2-setuptools')
source=(https://files.pythonhosted.org/packages/source/c/ck/${_name}-${pkgver}.tar.gz)
sha256sums=('77f7278f44521e976feb09de115d6823a9f503d82d3fd1882b836f77860fbc70')

prepare() {
  # copy folder, so we can cleanly build for both python versions
  cp -rup ck-$pkgver py2ck-$pkgver
}

build() {
  # build for python 3
  cd ck-$pkgver
  python setup.py build

  # build for python 2
  cd ../py2ck-$pkgver
  python2 setup.py build
}

package_python-ck() {
	depends=('git' 'ipython' 'python' 'python-pip')
  pkgdesc+=' for Python 3'

  cd ck-$pkgver
	python setup.py install --root=${pkgdir}/ --optimize=1
}

package_python2-ck() {
	depends=('git' 'ipython2' 'python2' 'python2-pip')
  pkgdesc+=' for Python 2'

  cd py2ck-$pkgver
	python2 setup.py install --root=${pkgdir}/ --optimize=1
}
