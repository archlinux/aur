# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgbase='flask-genshi'
pkgname=('python-flask-genshi' 'python2-flask-genshi')
_module='Flask-Genshi'
pkgver='0.5.1'
pkgrel='3'
pkgdesc='An extension to Flask for easy Genshi templating.'
arch=('any')
url='http://pypi.python.org/pypi/Flask-Genshi/'
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.python.org/packages/0e/46/9956b60f1c7dc5295c4b1f767dd8e5ff653b50c402adcb49f47e849c1013/${_module}-${pkgver}.tar.gz")
sha1sums=('4609c294557d3e338db08676162da966e1bf585f')

prepare() {
  cp -a "${srcdir}/${_module}-${pkgver}"{,-python2}
}

build() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_module}-${pkgver}-python2"
  python2 setup.py build
}

package_python2-flask-genshi() {
  depends+=('python2' 'python2-flask' 'python2-genshi')
  cd "${srcdir}/${_module}-${pkgver}-python2"

  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build --prefix="/usr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python-flask-genshi() {
  depends+=('python' 'python-flask' 'python-genshi')
  cd "${srcdir}/${_module}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build --prefix="/usr"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


# vim:set ts=2 sw=2 et:
