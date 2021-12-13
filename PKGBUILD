# Creator: Miguel de Val-Borro <miguel dot deval at gmail dot com>
# Maintainer: Médéric boquien <mboquien@free.fr>

pkgname=python-astroquery
pkgver=0.4.4
pkgrel=2
pkgdesc="Set of tools for querying astronomical web forms and databases"
arch=('x86_64')
url="http://astroquery.readthedocs.org/en/latest/"
license=('BSD')
depends=('python>=3.7' 'python-numpy>=1.16' 'python-astropy>=4.0' 'python-requests' 'python-keyring' 'python-beautifulsoup4' 'python-html5lib')
optdepends=('python-aplpy: required for the full functionality of the alma module'
            'python-pyregion: required for the full functionality of the alma module'
            'python-astropy-healpix: required for the full functionality of the cds module'
            'python-regions: required for the full functionality of the cds module'
            'python-boto3: required for the full functionality of the mast module'
)
conflicts=()
makedepends=('cython')
source=("https://files.pythonhosted.org/packages/source/a/astroquery/astroquery-${pkgver}.tar.gz")
sha512sums=('b8d96cacb901c3bab00103408d24694fad31f3fefa73c9c33accef671e6b7e253ea69912a3e3bd71c98a0fe5125fd6cfe4c5c52086b61a4fe4c864e9012f81a6')

build() {
  cd ${srcdir}/astroquery-${pkgver}

  PYTHONHASHSEED=0 python setup.py build
}

package() {
  cd ${srcdir}/astroquery-${pkgver}

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
  PYTHONHASHSEED=0 python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
