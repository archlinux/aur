# Maintainer: Fernando Ortiz <nandub+arch@nandub.info>
# Contributor: Niklas <dev@n1klas.net>

pkgbase=python-ck
pkgname=("python-ck" "python2-ck")
_name=ck
pkgver=1.12.3
pkgrel=1
pkgdesc="Collective Knowledge - lightweight knowledge manager to organize, cross-link, share and reuse artifacts and workflows"
arch=("any")
url="https://github.com/ctuning/ck"
license=("BSD 3-clause")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://files.pythonhosted.org/packages/6b/5c/1de5d81d516a2d639ecc950b73a70de6a372bf1f3ee62e67679f66d25262/${_name}-${pkgver}.tar.gz")
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
	depends=('python')
  pkgdesc+=" for Python 3"

  cd ck-$pkgver
	python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-ck() {
	depends=('python2')
  pkgdesc+=" for Python 2"

  cd py2ck-$pkgver
	python2 setup.py install --root="${pkgdir}/" --optimize=1
}
