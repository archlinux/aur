# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Nishit Joseph (reachjlight at gmail dot com)
# Contributor: Martin Corley <Martin.Corley@ed.ac.uk>

pkgname=python38-openpyxl
pkgver=3.0.10
pkgrel=1
pkgdesc="A Python library to read/write Excel 2007 xlsx/xlsm files"
arch=('any')
url="https://openpyxl.readthedocs.org/"
license=('MIT')
depends=('python38-et-xmlfile')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest' 'python38-py' 'python38-lxml' 'python38-pandas' 'python38-pillow')
optdepends=('python38-pillow: needed to include images'
            'python38-lxml: alternative XML backend'
            'python38-defusedxml: guard against various XML vulnerabilities'
            'python38-pandas: for iteration over Pandas DataFrames')
source=("https://foss.heptapod.net/openpyxl/openpyxl/-/archive/${pkgver}/openpyxl-${pkgver}.tar.bz2")
sha256sums=('265ae51674a0b30d5394a437a2c96c520c6cfcaf479a4d3e0f75d829d172664e')

build() {
  cd "$srcdir"/openpyxl-${pkgver}
  python3.8 setup.py build
}

check() {
  cd "$srcdir"/openpyxl-${pkgver}
  pytest
}

package() {
  cd "$srcdir"/openpyxl-${pkgver}
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENCE.rst "$pkgdir"/usr/share/licenses/$pkgname/LICENCE
}
