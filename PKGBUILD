# Creator: Miguel de Val-Borro <miguel dot deval at gmail dot com>
# Maintainer: Médéric boquien <mboquien@free.fr>

pkgname=python-astroquery
pkgver=0.4.2
pkgrel=1
pkgdesc="Set of tools for querying astronomical web forms and databases"
arch=('x86_64')
url="http://astroquery.readthedocs.org/en/latest/"
license=('BSD')
depends=('python>=3.6' 'python-numpy>=1.14' 'python-astropy>=3.1.2' 'python-requests' 'python-keyring' 'python-beautifulsoup4' 'python-html5lib')
optdepends=('python-aplpy: required for the full functionality of the alma module'
            'python-astropy-healpix: required for the full functionality of the cds module'
            'python-pyregion: required for the full functionality of the alma module'
            'python-regions: required for the full functionality of the cds module'
            'python-boto3: required for the full functionality of the mast module'
)
conflicts=()
makedepends=('cython')
source=("https://files.pythonhosted.org/packages/source/a/astroquery/astroquery-${pkgver}.tar.gz")
sha512sums=('2e9ff23d4b21e8b5c8bc6fb089a76834b4d45d13114b4760ccd9eb4c9a0a8e2098b92dcb59b48a2fdb21e7cb7ea8a558e34f9cc72bef1e181a0feca8f828d7c2')

build() {
  cd ${srcdir}/astroquery-${pkgver}
  python setup.py build --use-system-libraries --offline
}

package() {
  cd ${srcdir}/astroquery-${pkgver}

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
  python setup.py install --offline --root=${pkgdir} --prefix=/usr --optimize=1
}
