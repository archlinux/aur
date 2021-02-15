# Contributor: Alexandr Parkhomenko <it@52tour.ru>

_author=biolab
_pkgname=orange3
pkgname=python-$_pkgname-git
pkgver=3.27.1
pkgrel=1
pkgdesc="Open source data visualization and analysis for novice and experts. Data mining through visual programming or Python scripting."
arch=('x86_64')
url="http://orange.biolab.si/"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-chardet' 'python-docutils' 'python-pyqtgraph' 'python-xlrd' 'python-matplotlib' 'python-scikit-learn' 'python-psycopg2' 'python-joblib' 'python-keyrings-alt' 'python-bottleneck' 'python-anyqt' 'qt5-svg' 'python-pip' 'python-serverfiles' 'python-louvain' 'python-xlsxwriter' 'python-opentsne' 'python-networkx' 'python-requests' 'python-pandas' 'python-openpyxl' 'python-orange-widget-base-git' 'python-orange-canvas-core-git' 'python-baycomp' 'python-httpx' 'python-serverfiles' 'python-louvain' 'python-orange-widget-base-git')
source=("https://github.com/biolab/orange3/archive/master.zip")
sha256sums=('SKIP')
source=("git://github.com/$_author/$_pkgname")
sha256sums=('SKIP')

pkgver () {
  cd "$srcdir/$_pkgname"
  git describe --tags `git rev-list --tags --max-count=1` | sed -r 's/^v//;s/-RC/RC/;s/([^-]*-g)/r\1/;s/-/./g' #| sed -r "s/0$/$COMMIT/"
}

build() {
  cd "${srcdir}/$_pkgname"
  python setup.py build
}

package() {
  cd "${srcdir}/$_pkgname"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 distribute/orange-canvas.desktop "${pkgdir}"/usr/share/applications/orange-canvas.desktop
  install -Dm644 distribute/icon-256.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/orange-canvas.png
}

