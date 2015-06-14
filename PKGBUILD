# Maintainer: Hideaki Takahashi <mymelo+aur@gmail.com>
# Maintainer: Vincent Demeester <vincent@sbr.io>
# Contributor: Josh VanderLinden <arch@cloudlery.com>
python=python2

_libname=docker-py
pkgname=python2-$_libname
pkgver=1.2.2
pkgrel=1
pkgdesc="Python client for Docker."
depends=('python2-requests' 'python2-six' 'python2-websocket-client')
arch=('any')
source=(https://pypi.python.org/packages/source/d/docker-py/docker-py-$pkgver.tar.gz)
md5sums=('cd74eec5cf530bf762913645ec5cae7b')

url="https://github.com/dotcloud/docker-py"
license="Apache2"

build() {
    cd $srcdir/$_libname-$pkgver

    sed -i 's/==/>=/g' requirements.txt

    $python setup.py build || return 1
}

package() {
    cd $srcdir/$_libname-$pkgver

    $python setup.py install --root=$pkgdir

    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
