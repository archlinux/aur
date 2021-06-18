# Maintainer: Leonidas Spyropoulos <artafinde AT gmail DOT com>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: Mamy Ratsimbazafy <mamy (dot) ratsimbazafy_pkgbuild {at} gadz {dot} org>

pkgname=python-sklearn-pandas
pkgver=2.2.0
pkgrel=1
pkgdesc='Pandas integration with scikit-learn'
arch=(any)
url='https://github.com/scikit-learn-contrib/sklearn-pandas'
license=(custom:zlib/bsd)
depends=('python'
         'python-scikit-learn>=0.23.0'
         'python-scipy>=1.5.1'
         'python-pandas>=1.1.4'
         'python-numpy>=1.18.1')
makedepends=(python-setuptools)
checkdepends=(python-pytest python-joblib)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('290c587a1d6a74ebf2046b7753143cfedfe498fdb5b8b7318aee96fc98b20c12410bf7f03feb7a86fa5351a0dd899f7dce44b13090f49755cf20c15fa14082aa')

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
