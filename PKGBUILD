# Maintainer: Leonidas Spyropoulos <artafinde AT gmail DOT com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Mamy Ratsimbazafy <mamy (dot) ratsimbazafy_pkgbuild {at} gadz {dot} org>

pkgname=python-sklearn-pandas
pkgver=2.1.0
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
b2sums=('efae5ed3be80fee34608ab3b1705a07758711d462d534a4ab222cb2dd24a0f109d3007a15fc5ff9fedd2ebc2590af946ca6e8bfc7fe4bdca0b36833c237bca52')

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
