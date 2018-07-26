# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

pkgbase=python-txrequests
pkgname=(python-txrequests python2-txrequests)
pkgver=0.9.6
pkgrel=1
_distname=txrequests-$pkgver
pkgdesc='Asynchronous Python HTTP for Humans.'
license=('Apache')
arch=('any')
url='https://github.com/ross/txrequests'
makedepends=('python-setuptools' 'python-requests' 'python-twisted'
             'python2-setuptools' 'python2-requests' 'python2-twisted')
source=("https://pypi.python.org/packages/source/t/txrequests/txrequests-${pkgver}.tar.gz")
sha256sums=('b452a1cafa4d005678f6fa47922a330feb4907d5b4732d1841ca98e89f1362e1')

prepare() {
    cp -r ${_distname}{,-py2}
}

check() {
    cd "$srcdir"/$_distname
    python test_txrequests.py

    cd "$srcdir"/$_distname
    python2 test_txrequests.py
}

package_python-txrequests() {
    depends=('python-requests' 'python-twisted')
    cd $_distname
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-txrequests() {
    depends=('python2-requests' 'python2-twisted')
    cd "$_distname-py2"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim: set filetype=sh:
