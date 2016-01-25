# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=counterblock
pkgver=1.3.1
pkgrel=1
pkgdesc="Extended functionality for Counterparty"
arch=('any')
depends=('git'
         'leveldb'
         'libxml2'
         'libxslt'
         'mongodb'
         'perl-image-exiftool'
         'python2'
         'python2-aniso8601'
         'python2-appdirs'
         'python2-colorama'
         'python2-configobj'
         'python2-dateutil'
         'python2-flask'
         'python2-gevent'
         'python2-geventhttpclient'
         'python2-gevent-socketio'
         'python2-gevent-websocket'
         'python2-grequests-git'
         'python2-json-rpc'
         'python2-jsonschema'
         'python2-lxml'
         'python2-pillow'
         'python2-prettytable'
         'python2-pycoin'
         'python2-pygeoip'
         'python2-pymongo'
         'python2-pytest'
         'python2-python-bitcoinlib'
         'python2-pyzmq'
         'python2-redis'
         'python2-repoze.lru'
         'python2-requests'
         'python2-rfc3987'
         'python2-strict-rfc3339'
         'redis'
         'sqlite'
         'zeromq')
makedepends=('cython2' 'python2-setuptools')
optdepends=('armory: for armory_utxsvr'
            'counterparty-cli: Counterparty server')
groups=('counterparty')
url="https://github.com/CounterpartyXCP/counterblock"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/CounterpartyXCP/counterblock/tar.gz/$pkgver)
sha256sums=('b7554c5233e2d351ba3d37690c165ff414d4acc6da7ed8d41fd87a4e1b48d337')
install=counterblock.install

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Fixing setup.py...'
  sed -i "/'setup_requires':.*/d" setup.py
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
