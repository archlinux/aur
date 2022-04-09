# Contributor: Miguel de Val-Borro <miguel . deval @ gmail . com>

pkgname=python-astroquery-git
_gitname=astroquery
pkgver=0.4.6.r66.gc081ee4a
pkgrel=2
pkgdesc="Set of tools for querying astronomical web forms and databases"
arch=('any')
url="http://astroquery.readthedocs.org/en/latest/"
license=('BSD')
depends=('python' 'python-numpy' 'python-astropy' 'python-requests' 'python-keyring' 'python-beautifulsoup4' 'python-html5lib' 'python-astropy-helpers')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
makedepends=('python-setuptools' 'git')
source=("git+https://github.com/astropy/astroquery")
md5sums=(SKIP)

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd $_gitname
  python setup.py build --use-system-libraries --use-system-astropy-helpers --offline
}

package() {
  cd $_gitname
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE.rst licenses/*
  python setup.py install --root="${pkgdir}" --skip-build --optimize=1 --use-system-astropy-helpers
}
