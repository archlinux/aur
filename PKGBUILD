# Maintainer: Jake <aur@ja-ke.tech>
# Contributor: Alexander Scharinger
# Contributor: Tristan Webb <t2webb@ucsd.edu>
# Contributor Sindwiller
# Contributor SecByShresth <shresthpaul133@gmail.com>

pkgname=pyspread
pkgver=2.4.3
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
sha256sums=('58829be31aa51ad655221b095b006dd8ab21d19da94217cfe73f49ab8dccc357')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

  # Install desktop entry
  install -D -m644 \
    "pyspread/share/applications/io.gitlab.pyspread.pyspread.desktop" \
    "$pkgdir/usr/share/applications/pyspread.desktop"

  # Install icon from correct upstream path
  install -D -m644 \
    "pyspread/share/icons/hicolor/svg/pyspread.svg" \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/pyspread.svg"

  # Remove wrong upstream directory
  rm -rf "$pkgdir/usr/pyspread"
}
