# Maintainer:
# Contributor: a821
# Contributor: xantares
# Contributor: dalraf
pkgname=python-orange
pkgver=3.35.0
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
         'python-httpx'

         # AUR deps
         'python-anyqt' 'python-serverfiles' 'python-louvain' 'python-opentsne'
         'python-orange-widget-base' 'python-orange-canvas-core' 'python-baycomp')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/biolab/orange3/archive/refs/tags/${pkgver}.tar.gz")
optdepends=('python-psycopg2: PostgreSQL database support'
            'python-pymssql: Microsoft SQL Server support')
sha256sums=('7c323b5230d7e546487b30adfc00038c440ff81d74cceb50b5277be78f30144c')

build() {
  cd "${srcdir}/orange3-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/orange3-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 distribute/orange-canvas.desktop "${pkgdir}"/usr/share/applications/orange-canvas.desktop
  install -Dm644 distribute/icon-256.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/orange-canvas.png
}
