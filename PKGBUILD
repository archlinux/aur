# Contributor: Miguel de Val-Borro <miguel . deval @ gmail . com>

pkgname=python-astroquery-git
_gitname=astroquery
pkgver=0.4.11.r157.g067c6d2ce
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
  'python-build'
  'python-installer'
  'python-wheel'
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

prepare() {
  cd $_gitname
  sed -i '/ah_bootstrap/d' setup.py
}

build() {
  cd $_gitname
  python -m build --wheel --no-isolation
}

package() {
  cd $_gitname
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE.rst licenses/*
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set ts=2 sw=2 et:
