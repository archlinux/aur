# Maintainer: Zachary Vance <za3k at za3k dot com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Mario Danic <mario.danic@gmail.com>

pkgname=python2-paramiko
pkgver=2.7.2
pkgrel=1
pkgdesc="Python module that implements the SSH2 protocol"
url="https://github.com/paramiko/paramiko/"
license=('LGPL')
arch=('any')
depends=('python2-bcrypt' 'python2-cryptography' 'python2-pynacl-git')
makedepends=('python2-setuptools')
#checkdepends=('python2-pytest-runner' 'python2-pytest' 'python2-pyasn1' 'python2-mock')
source=("$pkgname-$pkgver.tar.gz::https://github.com/paramiko/paramiko/archive/$pkgver.tar.gz")
sha512sums=('c9bc569428a0a61814cb73941356de5bae7fea7891ba4fd3f5c00ff1ee5083454bfde7e969fb4aaf5254b909f7f0132f590d67803eda8a67503e5c02ec2bf01a')

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
