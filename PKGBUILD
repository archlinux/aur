#Contributor: Hector Mtz-Seara <hseara#at#gmail#com>
pkgname=python-pyzolib
_pkgname=pyzolib
pkgver=0.3.4
pkgrel=1
pkgdesc="The pyzolib package provides basic functionality for the Pyzo environment."
url="https://bitbucket.org/pyzo/pyzolib/"
license=('BSD')
arch=('any')
depends=('python-shiboken')
makedepends=('python-setuptools')
optdepends=("python-pyside: At least one installed"
            "python-pyqt4: At least one installed")


source=("https://pypi.python.org/packages/source/p/pyzolib/${_pkgname}-${pkgver}.tar.gz"
        "license.txt")
sha1sums=('7ea1bd0f51a2b6a7080ac6b95684a3ae69dceb60'
          'f48b8e7759daf06f23d55739af167c523796d508')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package(){
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  # Remove left over directories from distribute utils.  
  find ${pkgdir} -type d -name "__pycache__" -exec rm -r {} \; -prune

  # Install (New) BSD license
  install -D -m444 ${srcdir}/license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
