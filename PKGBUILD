# Maintainer: Miguel de Val-Borro <miguel . deval @ gmail . com>

_gitname=astroquery
pkgname=python-astroquery-git
pkgver=v0.3.7.r188.g90bed90f
pkgver() { cd $_gitname && git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'; }
pkgrel=1
pkgdesc="Set of tools for querying astronomical web forms and databases"
arch=('x86_64')
url="http://astroquery.readthedocs.org/en/latest/"
license=('BSD')
depends=('python>=3.4' 'python-numpy>=1.9' 'python-astropy>=1.0' 'python-requests' 'python-keyring' 'python-beautifulsoup4' 'python-html5lib' 'python-astropy-helpers')
conflicts=()
makedepends=('cython')
source=(git://github.com/astropy/astroquery)
md5sums=(SKIP)

build() {
  cd $_gitname
  python setup.py build --use-system-libraries --use-system-astropy-helpers --offline
}

package() {
  cd $_gitname

  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" licenses/*
  python setup.py install --offline --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-astropy-helpers
}
