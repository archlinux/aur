# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname=hep_ml
pkgname="python-${_pkgname}"
pkgver=0.6.2
pkgrel=1
pkgdesc="Specific machine learning tools for purposes of high energy physics"
arch=('any')
url="https://arogozhnikov.github.io/hep_ml/"
license=('Apache')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-scikit-learn' 'python-scipy' 'python-six' 'python-pandas' 'python-theano')
checkdepends=('python-nose')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/arogozhnikov/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('6f49a347a92cb3987bc64bfa6ca8e60db5892fc074fdcc5466ee9b1326fd3de4')

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
