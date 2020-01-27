# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgbase=python-libnacl
pkgname=('python-libnacl' 'python2-libnacl')
pkgver=1.7.1
pkgrel=1
pkgdesc='A simple ctypes based python binding to libsodium'
arch=('any')
url='https://libnacl.readthedocs.org'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'libsodium')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/saltstack/libnacl/archive/v$pkgver.tar.gz")
sha512sums=('4beb6a5f30688ea72836512f771c566f2c0c03bbdeade4f4135b3068945a3b3e0da826f97a78f495887e852c36629ddb33e876696263404e74fac11e3b7bc9e9')

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

