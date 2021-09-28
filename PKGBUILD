# Maintainer: Andreas Bolka <a AT bolka DOT at>

pkgname=visidata-git
pkgver=2.6.g666e3032
pkgrel=1
pkgdesc='A console spreadsheet tool for discovering and arranging data'
arch=('any')
url='http://visidata.org/'
license=('GPLv3')
depends=('python')
makedepends=('git' 'python-setuptools')
optdepends=('python-dnslib: pcap support'
            'python-dpkt: pcap support'  # AUR
            'python-fonttools: ttf/otf support'
            'python-h5py: hdf5 support'
            'python-lxml: html/xml support'
            'python-mapbox-vector-tile: mbtiles support'  # AUR
            'python-namestand: graphviz support'  # AUR
            'python-openpyxl: xlsx support'
            'python-pandas: dta (Stata) support'
            'python-pdfminer: pdf support'
            'python-psycopg2: postgres support'
            'python-pyaml: yaml/yml support'
            'python-pypng: png support'
            'python-pyshp: shapefiles support'  # AUR
            'python-requests: http support'
            'python-tabulate: tabulate saver support'
            'python-vobject: vcf support'
            'python-wcwidth: tabulate saver with unicode support'
            'python-xlrd: xls support')
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
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/${pkgname%-*}/CHANGELOG.md"
  cp -R docs/* "$pkgdir/usr/share/doc/${pkgname%-*}/"
}
