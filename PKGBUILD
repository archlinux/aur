# Maintainer: Pierre Lalet <pl@ivre.rocks>

pkgname=ivre
pkgver=0.9.11
pkgrel=1
pkgdesc="Network recon framework"
url="https://ivre.rocks/"
arch=('any')
license=('GPL3')
depends=('python' 'python-crypto' 'python-pymongo' 'python-future'
         'python-bottle')
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
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/cea-sec/$pkgname/v$pkgver/pkg/apache/ivre.conf")
sha256sums=('95f456024b101d8a834a5f1a6925cb8b8e4f5067d57fbe02e54f7183555cccef'
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
