# Maintainer: Sherlock Holo <Sherlockya@gmail.com>
pkgname=python-locust-git
_pkgname=locust
pkgver=v0.8a1.82.g8c4eeae
pkgrel=4
pkgdesc="An easy-to-use, distributed, user load testing tool."
arch=('any')
url="http://locust.io/"
license=('MIT')
depends=('python-gevent' 'python-flask' 'python-requests' 'python-msgpack' 'python-pyzmq')
makedepends=('git' 'python-setuptools')
source=('git://github.com/locustio/locust.git'
        'locust.patch')
md5sums=('SKIP'
         'cd7c5b5fafcd7ca2561ea9450b4bf26a')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags | sed "s/-/./g"
}

build() {
    cd $srcdir/$_pkgname
    patch -p0 -i locust.patch
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname
    python setup.py install --root=${pkgdir}/ --optimize=1
}
