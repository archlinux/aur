# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=rows
pkgname=python-${_pkgname}-git
pkgver=v0.4.1.r229.gd59b28f
pkgrel=1
pkgdesc='Import data, automatically detect types and give you high-level Python objects so you can start working with the data instead of trying to parse it'
arch=('any')
url='https://github.com/turicas/rows'
license=('GPL3')
depends=('python-cached-property' 'python-click' 'python-lxml' 'python-magic' 'python-openpyxl' 'python-pdfminer' 'python-pillow' 'python-psycopg2' 'python-pytesseract' 'python-requests' 'python-requests-cache' 'python-six' 'python-tqdm' 'python-unicodecsv' 'python-urllib3' 'python-xlrd' 'python-xlwt')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("git+https://github.com/turicas/rows")
sha512sums=('SKIP')
provides=("python-$_pkgname")
conflicts=("python-$_pkgname")

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's|^[^-]*-v||;s|-|.r|;s|-|.|g'
}

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}
