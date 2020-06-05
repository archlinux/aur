# Maintainer: Zachary Vance <za3k at za3k dot com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Mario Danic <mario.danic@gmail.com>

pkgname=python2-paramiko
pkgver=2.7.1
pkgrel=1
pkgdesc="Python module that implements the SSH2 protocol"
url="https://github.com/paramiko/paramiko/"
license=('LGPL')
arch=('any')
depends=('python2-bcrypt' 'python2-cryptography' 'python2-pynacl')
makedepends=('python2-setuptools')
#checkdepends=('python2-pytest-runner' 'python2-pytest' 'python2-pyasn1' 'python2-mock')
source=("$pkgname-$pkgver.tar.gz::https://github.com/paramiko/paramiko/archive/$pkgver.tar.gz")
sha512sums=('2cebed2420cf9af77cb0d459b64a74adcffcdb15bd58c8fc9243855ae91f43e16706665b64ce2851f6e99e59ca6a47d7299a2aae35a4c9d01ab97b343569c4b2')

# Check is disabled because it would involve maintaining at least 2 other python2 packages, both of which are neeeded ONLY by this check function.
# This package will be removed in <3 months when it's ported to python3.
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
