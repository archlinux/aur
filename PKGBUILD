# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: kevku <kevku@gmx.com>

pkgbase=python-librtmp
pkgname=(python-librtmp python2-librtmp)
pkgver=0.2.0
pkgrel=1
pkgdesc="Python interface to librtmp"
arch=('i686' 'x86_64')
url="https://github.com/chrippa/python-librtmp"
license=('custom: Simplified BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-cffi' 'python2-cffi')
source=("https://pypi.python.org/packages/source/p/$pkgbase/$pkgbase-$pkgver.tar.gz")
sha256sums=('0a4385aa59f6f4d09ffa95cb85c1b0acd4678c8af3f21f45dd009d5f807a9635')

prepare() {
  # copy folder, so we can cleanly build for both python versions
  cp -rup python-librtmp-$pkgver python2-librtmp-$pkgver
}

build() {
  # build for python 3
  cd python-librtmp-$pkgver
  python3 setup.py build

  # build for python 2
  cd ../python2-librtmp-$pkgver
  python2 setup.py build
}

# package for python 3
package_python-librtmp() {
  depends=('python3' 'python-cffi' 'rtmpdump')

  cd python-librtmp-$pkgver

  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# package for python 2
package_python2-librtmp() {
  depends=('python2' 'python2-singledispatch' 'python2-cffi' 'rtmpdump')

  cd python2-librtmp-$pkgver

  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
