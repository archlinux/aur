# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=Flask-Gravatar
pkgbase=python-flask-gravatar
pkgname=('python-flask-gravatar' 'python2-flask-gravatar')
pkgver=0.5.0
pkgrel=1
pkgdesc='Small and simple gravatar usage in Flask'
url='https://github.com/zzzsochi/Flask-Gravatar/'
arch=('any')
license=('BSD')
makedepends=('python-flask' 'python-sphinx' 'python-setuptools'
             'python2-flask' 'python2-sphinx' 'python2-setuptools')
checkdepends=('python-pytest'
              'python2-pytest')
source=(${pkgbase}-${pkgver}.tar.gz::https://github.com/zzzsochi/Flask-Gravatar/archive/v${pkgver}.tar.gz)
sha256sums=('9f9ea35b3537f635a25a09390821b768c9c3cf53274e16ffabbfc1f8c6e77d55')
sha512sums=('8acc5374e559687cc1b5fbaa90c1d17e96fd91e8b01d3df8083bc10c92afefb3725c03c4640e92e73d727320fc26235f80f6dfe36a06aeff49268af44110a23c')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
  sphinx-build -b text docs docs/_build/text
  sphinx-build -b man docs docs/_build/man
  python2 setup.py build
  sphinx-build2 -b text docs docs/_build-py2/text
  sphinx-build2 -b man docs docs/_build-py2/man
}

check() {
  cd ${_pkgname}-${pkgver}
  python setup.py test
  python2 setup.py test
}

package_python-flask-gravatar() {
  depends=('python' 'python-flask')
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 README.rst CHANGES.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build/man/flaskgravatar.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

package_python2-flask-gravatar() {
  depends=('python2' 'python2-flask')
  cd ${_pkgname}-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 README.rst CHANGES.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 docs/_build-py2/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 docs/_build-py2/man/flaskgravatar.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim: ts=2 sw=2 et:
