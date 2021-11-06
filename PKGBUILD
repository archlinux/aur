# Maintainer: a821
# Contributor: xantares
# Contributor: dalraf
pkgname=python-orange
pkgver=3.30.2
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
sha256sums=('fc5f184793f892e27cce3a61f12a2b1d05fee54da1f0626ea26fb211b74fced4')

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
