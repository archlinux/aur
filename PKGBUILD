# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname=hep_ml
pkgname="python-${_pkgname}"
pkgver=0.7.0
pkgrel=1
pkgdesc="Specific machine learning tools for purposes of high energy physics"
arch=('any')
url="https://arogozhnikov.github.io/hep_ml/"
license=('Apache')
makedepends=('python-setuptools')
depends=('python-numpy' 'python-scikit-learn' 'python-scipy' 'python-six' 'python-pandas' 'python-theano')
checkdepends=('python-nose')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/arogozhnikov/${_pkgname}/archive/v${pkgver}.tar.gz"
        'mse.patch')
sha256sums=('24bd5c61d0f3dc0660c158fcc2313fba3be04de9bf1162bf53728ff381154f0c'
            '86d42b9026fce2d623da01c6ceabb4bc85249dfa271d3a7c60fc8645623045d0')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/mse.patch"
}

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
