# Maintainer: Sherlock Holo <Sherlockya@gmail.com>
pkgname=python-locust-git
_pkgname=locust
pkgver=v0.8.1.67.g387e7a8
pkgrel=1
pkgdesc="An easy-to-use, distributed, user load testing tool."
arch=('any')
url="http://locust.io/"
license=('MIT')
depends=('python-gevent' 'python-flask' 'python-requests' 'python-msgpack' 'python-pyzmq' 'python-six')
makedepends=('git' 'python-setuptools')
source=('git+https://github.com/locustio/locust')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --tags | sed "s/-/./g"
}

build() {
    cd $srcdir
    cd $_pkgname
    sed -i "s/gevent>=1.2.2/gevent/" setup.py
    sed -i "s/flask>=0.10.1/flask/" setup.py
    sed -i "s/requests>=2.9.1/requests/" setup.py
    sed -i "s/msgpack-python>=0.4.2/msgpack-python/" setup.py
    sed -i "s/six>=1.10.0/six/" setup.py
    sed -i "s/pyzmq>=16.0.2/pyzmq/" setup.py
    python setup.py build
}

package() {
    cd $srcdir/$_pkgname
    python setup.py install --skip-build --root=${pkgdir}/ --optimize=1
}
