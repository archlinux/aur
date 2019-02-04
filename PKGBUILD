# Maintainer: Pierre Lalet <pl@ivre.rocks>

pkgname='ivre'
pkgver=0.9.12
pkgrel=1
pkgdesc='Network recon framework'
arch=('any')
url='https://ivre.rocks/'
license=('GPL3')
depends=('python' 'python-pymongo' 'python-future' 'python-bottle')
optdepends=('python-py2neo: experimental flow analysis (Neo4j backend)'
            'python-sqlalchemy: experimental PostgreSQL & SQLite backends'
            'python-psycopg2: experimental PostgreSQL backend'
            'python-pillow: trim screenshots on insertion'
            'tesseract: extract words from screenshots on insertion'
            'python-crypto: extract data from public keys ("ivre getmoduli")'
            'python-scapy: parse PCAP files for ARP inspection (flow analysis)'
            'python-matplotlib: create graphs from command line tools'
            'python-dbus: 3D traceroute graphs'
            'mongodb: database server'
            'postgresql: database server (experimental backend)'
            'neo4j-community: database server (experimental flow analysis)'
            'apache: Web server'
            'mod_wsgi: Web server'
            'dokuwiki: Web server (notebook)'
            'nmap: Network scan'
            'masscan: Network scan'
            'zmap: Network scan'
            'bro: Network traffic analysis'
            'argus: Network traffic analysis'
            'nfdump: Netflow analysis'
            'imagemagick: Screenshots via Nmap scripts'
            'phantomjs: HTTP screenshots via Nmap script'
            'ffmpeg: RTSP Screenshots via Nmap script')
makedepends=('python-setuptools')
backup=('etc/httpd/conf/extra/ivre.conf')
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/cea-sec/$pkgname/v$pkgver/pkg/apache/ivre.conf")
sha256sums=('e0d9df1d61d8483ed266738b70c33366b8860d0cc4a864d04924f91ab8abc4ca'
            '9c7267b7b2bde354e03a0cf683b56c0ca2410296bdd7424a964fb2b4f14c7ee3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  install -Dm0644 "$srcdir/ivre.conf" "$pkgdir/etc/httpd/conf/extra/ivre.conf"
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" doc/LICENSE*
  python setup.py install --root="$pkgdir" --optimize=1
}
