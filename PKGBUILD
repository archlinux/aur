# Maintainer: Kyle Keen <keenerd at gmail dot com>
pkgname=python2-pyzmq
pkgver=19.0.2
pkgrel=1
pkgdesc="Python2 bindings for zeromq, written in Cython"
arch=('x86_64')
url="http://www.zeromq.org/bindings:python"
license=('LGPL')
depends=('zeromq' 'python2')
checkdepends=('python2-nose' 'python2-tornado' 'python2-pytest' 'cython2')
#source=("https://github.com/zeromq/pyzmq/downloads/pyzmq-$pkgver.tar.gz")
#source=("https://pypi.python.org/packages/source/p/pyzmq/pyzmq-$pkgver.tar.gz")
source=("https://files.pythonhosted.org/packages/source/p/pyzmq/pyzmq-$pkgver.tar.gz"
        asyncio-wait-for-POLLOUT-on-sender-in-can_connect.patch)
md5sums=('200abc1a75bdcfff7adf61304f46f55e'
         '0a2106785a843c3f99411515b03f42a9')

prepare() {
  cd "$srcdir"

  # https://github.com/zeromq/pyzmq/issues/1418
  patch -Np1 -d pyzmq-${pkgver} <asyncio-wait-for-POLLOUT-on-sender-in-can_connect.patch
}

check() {
  cd "$srcdir/pyzmq-$pkgver"
  python2 setup.py build_ext --inplace
  python2 setup.py test
}

package() {
  cd "$srcdir/pyzmq-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=0
}
