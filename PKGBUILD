# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
pkgname=python2-pypkjs-git
pkgver=v1.0
pkgrel=1
pkgdesc="Python implementation of PebbleKit JS"
arch=('i686' 'x86_64')
url="https://github.com/pebble/pypkjs"
license=('GPL')
depends=('python2'
         'python2-libpebble2-git'
         'python2-backports.ssl_match_hostname'
         'python2-gevent'
         'python2-gevent-websocket'
         'python2-greenlet'
         'python2-peewee'
         'python2-pygeoip'
         'python2-pypng'
         'python2-dateutil'
         'python2-requests'
         'python2-sh'
         'python2-six'
         'python2-websocket-client'
         'python2-wsgiref'
         'python2-netaddr')
provides=('python2-pypkjs')
conflicts=('python2-pypkjs')
source=("git+https://github.com/pebble/pypkjs.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/pypkjs"
  git describe --tags | sed 's/-/./g'
}

prepare() {
  cd "$srcdir/pypkjs"
  git submodule update --init --recursive
}

package() {
  cd "$srcdir/pypkjs"
  python2 setup.py install --root="$pkgdir/" --optimize=1

  install -dm755 "$pkgdir/usr/bin/"
  install -m755 "phonesim.py" "$pkgdir/usr/bin/"
}

# vim:set ts=2 sw=2 et:
