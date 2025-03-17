# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Mario Danic <mario.danic@gmail.com>

pkgname='python-paramiko-ng'
_pkgname='paramiko-ng'
pkgver=2.9.0
pkgrel=1
pkgdesc="Python module that implements the SSH2 protocol"
provides=('python-paramiko')
conflicts=('python-paramiko')
url="https://ploxiln.github.io/paramiko-ng/"
license=('LGPL-2.1-only')
arch=('any')
makedepends=(python-build python-installer python-setuptools python-wheel)
depends=(python python-bcrypt python-cryptography python-pyasn1)
checkdepends=('python-mock' 'python-pytest')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/ploxiln/paramiko-ng/archive/$pkgver.tar.gz")
sha256sums=('d9ed4cd9c891bf12d76ce4dd81f87a554e4c2440d2b3bd512e9f2664f17a06c1')

check() {
  cd "$_pkgname-$pkgver"
  LANG=en_US.UTF-8 pytest
}

build() {
  cd "$_pkgname-$pkgver"
  PARAMIKO_REPLACE=1 python -m build -wn
}

package() {
  cd "$_pkgname-$pkgver"
  PARAMIKO_REPLACE=1 python -m installer --dest="$pkgdir" dist/*.whl
  install -dm755 "$pkgdir"/usr/share/doc/python-$_pkgname/demos
  install -m644 demos/* "$pkgdir"/usr/share/doc/python-$_pkgname/demos
  chmod 755 "$pkgdir"/usr/share/doc/python-$_pkgname/demos/*.py
}
