# Maintainer: Pierre Lalet <pl@ivre.rocks>

pkgname=ivre
pkgver=0.9.6
pkgrel=3
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
source=(https://github.com/cea-sec/$pkgname/archive/v$pkgver.tar.gz
        'apache.example.conf')
sha256sums=('4b8cda9dfb05493ee19fd334e7872bff39333b623974e6eafa976ec938d84d07'
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
