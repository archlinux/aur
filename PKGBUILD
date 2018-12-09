# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgbase='flask-babelex'
pkgname=('python-flask-babelex' 'python2-flask-babelex')
_module='Flask-BabelEx'
pkgver=0.9.3
pkgrel=2
pkgdesc='Adds i18n/l10n support to Flask applications'
arch=('any')
url='http://pypi.python.org/pypi/Flask-BabelEx/'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/80/ad/cc2b0becd98050eed775ca85d6e5fa784547acff69f968183098df8a52b3/Flask-BabelEx-$pkgver.tar.gz")
sha1sums=('37e50950f6e12407c4e3fb88cc4366fcc2a91765')

prepare() {
  cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_module}-${pkgver}-python2"
  python2 setup.py build
}

package_python2-flask-babelex() {
  depends+=('python2' 'python2-flask' 'python2-babel' 'python2-speaklater' 'python2-jinja')
  provides+=('python2-flask-babel')
  cd "${srcdir}/${_module}-${pkgver}-python2"

  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build --prefix="/usr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-flask-babelex() {
  depends+=('python' 'python-flask' 'python-babel' 'python-speaklater' 'python-jinja')
  provides+=('python-flask-babel')
  cd "${srcdir}/${_module}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build --prefix="/usr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
