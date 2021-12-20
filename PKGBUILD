# Maintainer: a821
# Contributor: xantares
# Contributor: dalraf
pkgname=python-orange
pkgver=3.31.0
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
         'python-orange-widget-base' 'python-orange-canvas-core' 'python-baycomp')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/biolab/orange3/archive/${pkgver}.tar.gz")
optdepends=('python-psycopg2: PostgreSQL database support'
            'python-pymssql: Microsoft SQL Server support')
sha256sums=('6de17dedae4b66e4fa7987675c234574369560491279da9052c95ff6bf2ad646')

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
