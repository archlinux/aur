# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Mario Danic <mario.danic@gmail.com>

pkgname='python-paramiko-ng'
_pkgname='paramiko-ng'
pkgver=2.7.4
pkgrel=1
pkgdesc="Python module that implements the SSH2 protocol"
provides=('python-paramiko')
conflicts=('python-paramiko')
url="https://ploxiln.github.io/paramiko-ng/"
license=('LGPL')
arch=('any')
makedepends=('python-setuptools')
depends=('python-bcrypt' 'python-cryptography' 'python-pyasn1' 'python-pynacl')
checkdepends=('python-mock' 'python-pytest')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/ploxiln/paramiko-ng/archive/$pkgver.tar.gz")
sha256sums=('9cc7f3313de47a38901e2524072fdc0ac5d9cc991132600fa296cb9b2998f112')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  LANG=en_US.UTF-8 pytest
}

package() {
  cd "$_pkgname-$pkgver"

  PARAMIKO_REPLACE=1 python setup.py install --root="$pkgdir" --optimize=1
  install -dm755 "$pkgdir"/usr/share/doc/python-$_pkgname/demos
  install -m644 demos/* "$pkgdir"/usr/share/doc/python-$_pkgname/demos
  chmod 755 "$pkgdir"/usr/share/doc/python-$_pkgname/demos/*.py
}
