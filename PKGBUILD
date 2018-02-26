# Maintainer: Pierre Lalet <pl@ivre.rocks>

pkgname=ivre
pkgver=0.9.8
pkgrel=1
pkgdesc="Network recon framework"
url="https://ivre.rocks/"
arch=('any')
license=('GPL3')
depends=('python' 'python-crypto' 'python-pymongo' 'python-future')
optdepends=('python-py2neo: flow analysis support'
            'python-sqlalchemy: PostgreSQL backend support'
            'python-psycopg2: PostgreSQL backend support'
            'python-pillow: Screenshots'
            'python-dbus: 3D traceroute graphs'
            'python-matplotlib: Plots'
            'mongodb: database server'
            'postgresql: database server'
            'apache: Web server'
            'dokuwiki: Web server (notebook)'
            'nmap: Network scan'
            'masscan: Network scan'
            'zmap: Network scan'
            'bro: Network traffic analysis'
            'argus: Network traffic analysis'
            'nfdump: Netflow analysis'
            'phantomjs: Screenshots (http)'
            'imagemagick: Screenshots'
            'ffmpeg: Screenshots (rtsp)'
            'tesseract: Screenshots analysis')
makedepends=('python-setuptools')
backup=('etc/httpd/conf/extra/ivre.conf')
source=(https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz
        'apache.example.conf')
sha256sums=('d3eb6c48ea53111991883fdff5cb5170797a8cf1287fe1bcd29ef760b0c882af'
            '3e372f51f2ad441baf8268ce29d35b3a1cb9ef4cb29e7864fab389759694f72e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/ivre/" doc/LICENSE*
  install -Dm0644 "$srcdir"/apache.example.conf "$pkgdir/etc/httpd/conf/extra/ivre.conf"
  python setup.py install --root="$pkgdir" --optimize=1
}
