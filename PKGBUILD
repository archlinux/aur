# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=counterblock-git
pkgver=20150330
pkgrel=1
pkgdesc="Extended functionality for Counterparty"
arch=('any')
depends=('cython2'
         'git'
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
         'python2-geventhttpclient-git'
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
makedepends=('git'
             'python2-setuptools')
optdepends=('armory-git: for armory_utxsvr'
            'counterparty-cli-git: Counterparty server'
            'python: for armory_utxsvr')
groups=('counterparty')
url="https://github.com/CounterpartyXCP/counterblock"
license=('MIT')
source=(git+https://github.com/CounterpartyXCP/counterblock)
sha256sums=('SKIP')
provides=('counterblock')
conflicts=('counterblock')
install=counterblock.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd ${pkgname%-git}

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
