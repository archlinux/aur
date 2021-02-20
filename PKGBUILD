# Maintainer: Leonidas Spyropoulos <artafinde AT gmail DOT com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Mamy Ratsimbazafy <mamy (dot) ratsimbazafy_pkgbuild {at} gadz {dot} org>

pkgname=python-sklearn-pandas
pkgver=2.0.4
pkgrel=1
pkgdesc='Pandas integration with scikit-learn'
arch=(any)
url='https://github.com/scikit-learn-contrib/sklearn-pandas'
license=(Custom)
depends=('python'
         'python-scikit-learn>=0.23.0'
         'python-scipy>=1.5.1'
         'python-pandas>=1.1.4'
         'python-numpy>=1.18.1')
makedepends=(python-setuptools)
checkdepends=(python-pytest python-joblib)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('f7bc372fa5a0c28202a11f79e5c85c681aef67dc568daf42d17c630bad70ff51bdd663bdcaab62dbd5ab2ec3e358adce282e6e0e082e709ab26e902dc1a5732e')

build() {
  cd "${srcdir}/sklearn-pandas-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/sklearn-pandas-${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}/sklearn-pandas-${pkgver}"
  export PYTHONHASHSEED=0
  python setup.py install --optimize=1 --skip-build --root="${pkgdir}"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
