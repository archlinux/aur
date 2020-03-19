# Maintainer: Niklas <dev@n1klas.net>

pkgbase=python-chainmap
pkgname=("python-chainmap" "python2-chainmap")
_name=chainmap
pkgver=1.0.3
pkgrel=1
pkgdesc="Backport/clone of ChainMap"
arch=("any")
url="https://bitbucket.org/jeunice/chainmap"
license=("PSF")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e42aaa4b3e2f66102a11bfd563069704bfbfd84fdcb517b564effd736bf53cd9')

prepare() {
  # copy folder, so we can cleanly build for both python versions
  cp -rup chainmap-$pkgver py2chainmap-$pkgver
}

build() {
  # build for python 3
  cd chainmap-$pkgver
  python setup.py build

  # build for python 2
  cd ../py2chainmap-$pkgver
  python2 setup.py build
}

package_python-chainmap() {
	depends=('python<=3.2')
  pkgdesc+=" for Python 3"

  cd chainmap-$pkgver
	python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-chainmap() {
	depends=('python2>=2.6')
  pkgdesc+=" for Python 2"

  cd py2chainmap-$pkgver
	python2 setup.py install --root="${pkgdir}/" --optimize=1
}
