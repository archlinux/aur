# Maintainer: Andreas Bolka <a AT bolka DOT at>

pkgname=visidata-git
pkgver=1.5.2.g32771e0
pkgrel=1
pkgdesc='A console spreadsheet tool for discovering and arranging data'
arch=('any')
url='http://visidata.org/'
license=('GPLv3')
depends=('python')
makedepends=('git' 'python-setuptools')
optdepends=('python-dateutil: for converting string column to datetime'
            'python-openpyxl: for opening .xlsx files'
            'python-h5py: for opening .hdf5 files'
            'python-google-api-python-client: for opening Google sheets')
provides=('visidata')
conflicts=('visidata')
source=("$pkgname::git+https://github.com/saulpw/visidata")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  local PYVER=$(python setup.py --version)
  local GITID=$(git rev-parse --short HEAD)
  echo "$PYVER.g$GITID"
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py -q install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.gpl3 "$pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE"
}
