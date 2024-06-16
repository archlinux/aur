# Contributor: Miguel de Val-Borro <miguel . deval @ gmail . com>

pkgname=python-astroquery-git
_gitname=astroquery
pkgver=0.4.7.r188.g06de109c5
pkgrel=1
pkgdesc="Set of tools for querying astronomical web forms and databases"
arch=('any')
url="https://astroquery.readthedocs.org/en/latest/"
license=('BSD-3-Clause')
depends=(
  'python-astropy'
  'python-numpy'
  'python-requests'
  'python-keyring'
  'python-beautifulsoup4'
  'python-html5lib'
  'python-pyvo'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
makedepends=(
  'git'
  'python-astropy-helpers'
  'python-setuptools'
)
optdepends=(
  'python-astropy-healpix: for full functionality of the alma module'
  'python-regions: for full functionality of the alma module'
  'python-boto3: for full functionality of the mast module'
)
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

# vim: set ts=2 sw=2 et:
