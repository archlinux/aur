# Maintainer: Lari Tikkanen <lartza@wippies.com>

pkgname=python2-irc3-git
_pkgname=irc3
pkgver=0.7.1.r5.gb283d68
pkgrel=1
pkgdesc="plugable irc client library based on asyncio (Git version)"
arch=(any)
url="https://github.com/gawel/irc3"
license=('MIT')
depends=('python2' 'python2-configparser' 'python2-trollius' 'python2-venusian')
makedepends=('python2-setuptools' 'git')
provides=(python2-irc3)
conflicts=(python2-irc3)
source=(git://github.com/gawel/irc3)
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cd $srcdir/$_pkgname
    python2 setup.py build
}

package() {
    cd $srcdir/$_pkgname
    python2 setup.py install --root=$pkgdir --optimize=1
}
