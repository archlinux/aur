# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Alexander Scharinger
# Contributor: Tristan Webb <t2webb@ucsd.edu>
# Contributor Sindwiller
# Contributor SecByShresth <shresthpaul133@gmail.com>

# Maintainer: Your Name <youremail@example.com>
pkgname=pyspread
pkgver=2.4.1
pkgrel=1
pkgdesc="Python based non-traditional spreadsheet application with GUI"
arch=('any')
url="https://pyspread.gitlab.io/"
license=('GPL3')
depends=(
  'python-setuptools'
  'python-numpy'
  'python-pyqt6'
  'python-markdown2'
)
optdepends=(
  'python-matplotlib: plotting support'
  'python-pyenchant: spell checking'
  'python-pip: plugin installation'
  'python-dateutil: date handling'
  'python-rpy2: R integration'
  'python-plotnine: ggplot-like plotting'
  'libvoikko: Finnish spell checking'
  'nuspell: spell checking'
  'hspell: Hebrew spell checking'
  'r-ggplot2: R plotting'
  'python-openpyxl: Excel file support'
)
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pyspread/pyspread-$pkgver.tar.gz")
sha256sums=('6686fe39741b6b28449d298a52ebe791a12e061eda3b627c0eb1f2cde3f9e83c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

  # Install icon
  install -D "data/icons/pyspread.svg" \
    "$pkgdir/usr/share/pixmaps/${pkgname}.svg"

  # Install desktop entry
  install -D -m644 "data/pyspread.desktop" \
    "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
