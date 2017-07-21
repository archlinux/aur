# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgbase=python-libnacl
pkgname=('python-libnacl' 'python2-libnacl')
pkgver=1.5.2
pkgrel=1
pkgdesc='A simple ctypes based python binding to libsodium'
arch=('any')
url='http://libnacl.readthedocs.org'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'libsodium')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/saltstack/libnacl/archive/v$pkgver.tar.gz")
sha512sums=('b4aa26b407855a73ac08ab5abc684f37338e960f534c04edb471634029388b9b11a79b02220eced99fcc94df7e1c05cbf4a0df48bb8b45b5f79e43cddfee790a')

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

