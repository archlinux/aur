# Maintainer: redponike <proton (dot) me>
# Contributor: a821
# Contributor: xantares
# Contributor: dalraf

pkgname=python-orange
pkgver=3.38.1
pkgrel=1
pkgdesc="Open source machine learning and data visualization"
arch=('x86_64')
url="https://orangedatamining.com/"
license=('GPL3')
makedepends=('python-setuptools' 'cython')
depends=('python-chardet' 'python-pyqtgraph' 'python-xlrd' 'python-matplotlib'
         'python-scikit-learn' 'python-joblib' 'python-keyrings-alt' 'python-bottleneck'
         'python-pip' 'python-xlsxwriter' 'python-networkx' 'python-requests' 'python-pandas'
         'python-openpyxl' 'python-httpx' 'python-numpy' 'python-scipy' 'python-yaml'
         'python-pygments' 'python-qtconsole' 'python-pyqt5-webengine'

         # AUR deps
         'python-anyqt' 'python-serverfiles' 'python-louvain' 'python-opentsne'
         'python-orange-widget-base' 'python-orange-canvas-core' 'python-baycomp'
         'python-requests-cache')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/biolab/orange3/archive/refs/tags/${pkgver}.tar.gz"
        "0001-numpy-2-compatibility.diff::https://github.com/biolab/orange3/pull/6850.diff")
optdepends=('python-psycopg2: PostgreSQL database support'
            'python-pymssql: Microsoft SQL Server support')
sha256sums=('8f5cb4acdf310b0c92e44562ff34ee1752cb323b2aa055cc9fa3591d6f9f76c2'
            '29ce48c45351780b89863739017ce851928a633362d160ebc594bca84eeb14b4')

prepare() {
  cd "${srcdir}/orange3-${pkgver}"
  patch -p1 -i "${srcdir}/0001-numpy-2-compatibility.diff"
}

build() {
  cd "${srcdir}/orange3-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/orange3-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 distribute/orange-canvas.desktop "${pkgdir}"/usr/share/applications/orange-canvas.desktop
  install -Dm644 distribute/icon-256.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/orange-canvas.png
}
