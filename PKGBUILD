# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Thomas S Hatch <thatch45@gmail.com>

pkgbase=python-libnacl
pkgname=('python-libnacl' 'python2-libnacl')
pkgver=1.6.0
pkgrel=1
pkgdesc='A simple ctypes based python binding to libsodium'
arch=('any')
url='http://libnacl.readthedocs.org'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'libsodium')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/saltstack/libnacl/archive/v$pkgver.tar.gz")
sha512sums=('6f5202ca50bf30526bc51e2c528fe86aa412eff4b912d0b09da7f019de2929d2be2a9a8f80340849cf77b3593eae4fa96f2c0920b5201c5786f5009ad5f32c34')

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

