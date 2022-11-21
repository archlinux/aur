# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Mario Danic <mario.danic@gmail.com>

pkgname=python38-paramiko
pkgver=2.11.1
pkgrel=1
pkgdesc="Python module that implements the SSH2 protocol"
url="https://github.com/paramiko/paramiko/"
license=('LGPL')
arch=('any')
depends=('python38-bcrypt' 'python38-cryptography' 'python38-pynacl')
makedepends=('python38-setuptools' 'python38-bcrypt' 'python38-cryptography' 'python38-pynacl')
checkdepends=('python38-pytest-runner' 'python38-pytest-relaxed' 'python38-pyasn1' 'python38-invoke'
             'python38-mock')
source=("https://github.com/paramiko/paramiko/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('7cf3f9124fcdd5df2f132bec213be60fe2e78a95eee80e0a4388459d22907d2c23dbf4cc7ae7bfc9575f392aacad5b3d3a32955b662a0804999e24b922269bc5')

check() {
  cd paramiko-$pkgver
  LANG=en_US.UTF-8 python3.8 setup.py pytest
}

package() {
  cd paramiko-$pkgver

  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -dm755 "$pkgdir"/usr/share/doc/$pkgname/demos
  install -m644 demos/* "$pkgdir"/usr/share/doc/$pkgname/demos
  chmod 755 "$pkgdir"/usr/share/doc/$pkgname/demos/*.py
}
