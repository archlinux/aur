# Maintainer: Hideaki Takahashi <mymelo+aur@gmail.com>
# Maintainer: Vincent Demeester <vincent@sbr.io>
# Contributor: Josh VanderLinden <arch@cloudlery.com>
python=python2

_libname=docker-py
pkgname=python2-$_libname
pkgver=1.4.0
pkgrel=2
pkgdesc="Python client for Docker."
depends=('python2-requests' 'python2-six' 'python2-websocket-client>=0.32.0')
makedepends=('python2-setuptools')
arch=('any')
source=(https://pypi.python.org/packages/source/d/docker-py/docker-py-$pkgver.tar.gz)
md5sums=('3b9fbbd6f973499713932e074a2de879')

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
