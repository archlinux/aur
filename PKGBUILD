# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgbase=python-libnacl
pkgname=('python-libnacl' 'python2-libnacl')
pkgver=1.6.1
pkgrel=2
pkgdesc='A simple ctypes based python binding to libsodium'
arch=('any')
url='https://libnacl.readthedocs.org'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'libsodium')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/saltstack/libnacl/archive/v$pkgver.tar.gz")
sha512sums=('90fd9302cdfbe84acfc7dff0ac95eeb05fd1bb346cd8b220613174d5d1ae5f627be06b4d588fd4a939c49a119ca557d68a06d3cbe1c0d409a253fdca96d944ac')

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

