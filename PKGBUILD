# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname=hep_ml
pkgname="python-${_pkgname}"
pkgver=0.7.3
pkgrel=1
pkgdesc="Specific machine learning tools for purposes of high energy physics"
arch=('any')
url="https://arogozhnikov.github.io/hep_ml/"
license=('Apache-2.0')
makedepends=(python-build python-installer python-wheel)
depends=('python-numpy' 'python-scikit-learn' 'python-scipy' 'python-six' 'python-pandas' 'python-theano')
checkdepends=('python-nose')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/arogozhnikov/${_pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('05350efe152771a5913686fe143fb614df8209f77ab9f2193bb573c46d462f77cadf36f88abee259a37fb2f634fdd965eab379ee067c9551e19feb960a5ce4c8')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  nosetests tests
}

package_python-hep_ml() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
}
