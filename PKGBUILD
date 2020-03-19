# Maintainer: Fernando Ortiz <nandub+arch@nandub.info>

pkgbase=pypy-chainmap
pkgname=("pypy-chainmap" "pypy3-chainmap")
_name=chainmap
pkgver=1.0.3
pkgrel=1
pkgdesc="Backport/clone of ChainMap"
arch=("any")
url="https://bitbucket.org/jeunice/chainmap"
license=("PSF")
makedepends=("pypy-setuptools" "pypy3-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('e42aaa4b3e2f66102a11bfd563069704bfbfd84fdcb517b564effd736bf53cd9')

prepare() {
  # copy folder, so we can cleanly build for both pypy versions
  cp -rup chainmap-$pkgver pypy3chainmap-$pkgver
}

build() {
  # build for pypy 3
  cd chainmap-$pkgver
  pypy setup.py build

  # build for pypy 2
  cd ../pypy3chainmap-$pkgver
  pypy3 setup.py build
}

package_pypy-chainmap() {
	depends=('pypy')
  pkgdesc+=" for Pypy"

  cd chainmap-$pkgver
	pypy setup.py install --root="${pkgdir}/" --optimize=1
}

package_pypy3-chainmap() {
	depends=('pypy3')
  pkgdesc+=" for Pypy 3"

  cd pypy3chainmap-$pkgver
	pypy3 setup.py install --root="${pkgdir}/" --optimize=1
}
