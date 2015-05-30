# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: kevku <kevku@gmx.com>

pkgbase=python-librtmp
pkgname=(python-librtmp python2-librtmp)
pkgver=0.3.0
pkgrel=1
pkgdesc="Python interface to librtmp"
arch=('i686' 'x86_64')
url="https://github.com/chrippa/python-librtmp"
license=('custom: Simplified BSD')
makedepends=('python-setuptools' 'python-cffi'
             'python2-setuptools' 'python2-cffi' 'python2-singledispatch'
             'rtmpdump')
source=("https://pypi.python.org/packages/source/p/$pkgbase/$pkgbase-$pkgver.tar.gz")
sha256sums=('4a41ada646270baa5b388f17481d08679d23b2947835901d0db7602c59ec772b')

prepare() {
  # copy folder, so we can cleanly build for both python versions
  cp -rup python-librtmp-$pkgver python2-librtmp-$pkgver
}

build() {
  # build for python 3
  cd python-librtmp-$pkgver
  python setup.py build

  # build for python 2
  cd ../python2-librtmp-$pkgver
  python2 setup.py build
}

# package for python 3
package_python-librtmp() {
  depends=('python' 'python-cffi' 'rtmpdump')
  pkgdesc+=" (python3 version)"

  cd python-librtmp-$pkgver

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# package for python 2
package_python2-librtmp() {
  depends=('python2' 'python2-singledispatch' 'python2-cffi' 'rtmpdump')
  pkgdesc+=" (python2 version)"

  cd python2-librtmp-$pkgver

  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
