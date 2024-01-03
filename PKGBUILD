# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname=hep_ml
pkgname="python-${_pkgname}"
pkgver=0.7.2
pkgrel=1
pkgdesc="Specific machine learning tools for purposes of high energy physics"
arch=('any')
url="https://arogozhnikov.github.io/hep_ml/"
license=('Apache')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-scikit-learn' 'python-scipy' 'python-six' 'python-pandas' 'python-theano')
checkdepends=('python-nose')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/arogozhnikov/${_pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('a9da308da46ecc70aa1829e01b1e1692f5231c498ee6d6687132fbd03b3b6b1e028a4e1ae53a53e8f7e024784fcb47278ce17d8bbd310193b4be57955babd123')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  nosetests tests
}

package_python-hep_ml() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
}
