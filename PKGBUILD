# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgbase=python-libnacl
pkgname=('python-libnacl' 'python2-libnacl')
pkgver=1.5.0
pkgrel=1
pkgdesc='A simple ctypes based python binding to libsodium'
arch=('any')
url='http://libnacl.readthedocs.org'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'libsodium' 'git')
source=("git+https://github.com/saltstack/libnacl.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
  cp -r libnacl{,-py2}
}

build() {
  cd "$srcdir"/libnacl
  python setup.py build

  cd "$srcdir"/libnacl-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/libnacl
  python -m unittest discover --start-directory tests -v

  cd "$srcdir"/libnacl-py2
  python2 -m unittest discover --start-directory tests -v
}

package_python-libnacl() {
  depends=('python' 'libsodium')

  cd libnacl
  python3 setup.py install --root="$pkgdir" -O1
}

package_python2-libnacl() {
  depends=('python2' 'libsodium')

  cd libnacl-py2
  python2 setup.py install --root="$pkgdir" -O1
}

