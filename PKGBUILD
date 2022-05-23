# Maintainer: Zachary Vance <za3k at za3k dot com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Mario Danic <mario.danic@gmail.com>

pkgname=python2-paramiko
pkgver=2.11.0
pkgrel=1
pkgdesc="Python module that implements the SSH2 protocol"
url="https://github.com/paramiko/paramiko/"
license=('LGPL')
arch=('any')
depends=('python2-bcrypt' 'python2-cryptography' 'python2-pynacl-git')
makedepends=('python2-setuptools')
#checkdepends=('python2-pytest-runner' 'python2-pytest' 'python2-pyasn1' 'python2-mock')
source=("$pkgname-$pkgver.tar.gz::https://github.com/paramiko/paramiko/archive/$pkgver.tar.gz")
sha512sums=('59e439bd54d83938f91d6c9888f2278bafa4ca48582939580bdabc6207dbe6dc856f6006ad26b7ec91b9d39e92ca70dc6270c6b5d4f77a5e1fa0ec8bd084d4b5')

# Check is disabled because it would involve maintaining at least 2 other python2 packages, both of which are neeeded ONLY by this check function.
# This package will be removed when fabric1 is ported to python3.
check() {
  #cd paramiko-$pkgver
  #LANG=en_US.UTF-8 python2 setup.py pytest
  :
}

package() {
  cd paramiko-$pkgver

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -dm755 "$pkgdir"/usr/share/doc/$pkgname/demos
  install -m644 demos/* "$pkgdir"/usr/share/doc/$pkgname/demos
  chmod 755 "$pkgdir"/usr/share/doc/$pkgname/demos/*.py
}
