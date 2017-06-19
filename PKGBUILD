# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgbase=python-libnacl
pkgname=('python-libnacl' 'python2-libnacl')
pkgver=1.5.1
pkgrel=1
pkgdesc='A simple ctypes based python binding to libsodium'
arch=('any')
url='http://libnacl.readthedocs.org'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'libsodium')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/saltstack/libnacl/archive/v$pkgver.tar.gz")
sha512sums=('7c270370e1ba9b82413b96b95e1ed66852531df6c2636b67401391ad9ba9c18789f532cdea31b60bc045fca7388df04dde2ad0870cb999529889178456fca70e')

prepare() {
  cp -r libnacl-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/libnacl-$pkgver
  python setup.py build

  cd "$srcdir"/libnacl-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/libnacl-$pkgver
  python -m unittest discover --start-directory tests -v

  cd "$srcdir"/libnacl-$pkgver-py2
  python2 -m unittest discover --start-directory tests -v
}

package_python-libnacl() {
  depends=('python' 'libsodium')

  cd libnacl-$pkgver
  python3 setup.py install --root="$pkgdir" -O1
}

package_python2-libnacl() {
  depends=('python2' 'libsodium')

  cd libnacl-$pkgver-py2
  python2 setup.py install --root="$pkgdir" -O1
}

