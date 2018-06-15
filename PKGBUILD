# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Alexander 'z33ky' Hirsch <1zeeky@gmail.com>

pkgbase=python-requests-futures
pkgname=(python-requests-futures python2-requests-futures)
pkgver=0.9.7
pkgrel=4
_distname=requests-futures-$pkgver
pkgdesc='Asynchronous Python HTTP for Humans.'
license=('Apache')
arch=('any')
url='https://github.com/ross/requests-futures'
makedepends=('python-setuptools' 'python-requests'
             'python2-setuptools' 'python2-requests' 'python2-futures')
source=("https://pypi.python.org/packages/source/r/requests-futures/requests-futures-${pkgver}.tar.gz")
sha256sums=('a9ca2c3480b6fac29ec5de59c146742e2ab2b60f8c68581766094edb52ea7bad')

prepare() {
    cp -r ${_distname}{,-py2}
}

check() {
    cd "$srcdir"/$_distname
    python test_requests_futures.py

    cd "$srcdir"/$_distname
    python2 test_requests_futures.py
}

package_python-requests-futures() {
    depends=('python-requests')
    cd $_distname
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-requests-futures() {
    depends=('python2-requests' 'python2-futures')
    cd "$_distname-py2"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim: set filetype=sh:
