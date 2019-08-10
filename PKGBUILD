pkgname=magnetico-git
_pkgname=magnetico
pkgver=a
pkgrel=1
pkgdesc="Autonomous (self-hosted) BitTorrent DHT search engine suite"
arch=('any')
options=('!strip')
url="http://labs.boramalper.org/magnetico/"
license=('AGPLv3')
depends=('python-uvloop' 'python-humanfriendly' 'python-better-bencode' 'python-gevent' 'python-flask' 'python-cerberus')
makedepends=('python-setuptools')
provides=('magnetico')
source=("git://github.com/boramalper/magnetico")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname/magneticod"
  python setup.py build

  cd "$srcdir/$_pkgname/magneticow"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname/magneticod"
  python setup.py install --root="$pkgdir/" --optimize=1

  cd "$srcdir/$_pkgname/magneticow"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
