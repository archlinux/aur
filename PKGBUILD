# Maintainer: Hideaki Takahashi <mymelo+aur@gmail.com>
python=python

_libname=pushbullet.py
pkgname=python-$_libname
pkgver=0.8.1
pkgrel=1
pkgdesc="A simple python client for pushbullet.com."
depends=('python-requests' 'python-magic' 'python-websocket-client')
arch=('any')
source=(https://pypi.python.org/packages/source/p/pushbullet.py/${_libname}-${pkgver}.tar.gz)
md5sums=('1e8eccd95062df199830d92a29c57bdf')

url="https://github.com/randomchars/pushbullet.py"
license="MIT"

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
