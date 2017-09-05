# Maintainer: Morten Linderud <morten@linderud.pw>  
# Contributor: Javier Tia <javier dot tia at gmail dot com>
_pkgname=humanize
pkgname="python2-${_pkgname}"
pkgver=0.5.1
pkgrel=7
pkgdesc='a modest package contains various common humanization utilities'
url='https://github.com/jmoiron/humanize'
arch=('any')
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools' 'python2-sphinx')
checkdepends=('python2-tox')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jmoiron/humanize/archive/$pkgver.tar.gz")
sha256sums=('e3f3ac75e647f75eec48c3950385ab7585c1c1cde2a6c1479c1f58e055a3e868')

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  tox2 -e py27
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
  make -C ./docs html
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  mv ./docs/_build/html/* "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
