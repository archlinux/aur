pkgname=python-oosheet
pkgver=1.2
pkgrel=1
pkgdesc="OpenOffice.org Spreadsheet scripting library. Patched for Python 3."
url="http://oosheet.hacklab.com.br/"
depends=('python' 'libreoffice')
makedepends=('python3')
license=('MIT')
arch=('any')
source=("https://github.com/lfagundes/oosheet/archive/v${pkgver}.tar.gz"
        "python3.patch")
sha256sums=('8a3778ea8087ee52e9e0ef7f104147ae9fbbc82a7b1a6449d849f71e9872669c'
            'c237da30c4734923a0a631b15e11b720c77fefabf4ec5a0ab5dfc47b5a13463a')

# Patch comes from: https://github.com/znbn/oosheet/tree/python3

build() {
  cd "${srcdir}/oosheet-${pkgver}"
  patch -p1 -i "${srcdir}"/python3.patch
  python setup.py build
}

package() {
  cd "${srcdir}/oosheet-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
