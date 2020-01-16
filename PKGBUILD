# Maintainer: Michael Borders <dev@michaelborders.net>

pkgname=python-netmiko
_pkgname=netmiko
pkgver=3.0.0
_pkgver="v${pkgver}"
pkgrel=2
pkgdesc="Multi-vendor library to simplify Paramiko SSH connections to network devices"
arch=('any')
url="https://github.com/ktbyers/netmiko"
license=('MIT')
depends=('python' 'python-paramiko' 'python-scp' 'python-pyserial' 'python-textfsm')
makedepends=('python-setuptools')
checkdepends=('python-tox')
source=("${url}/archive/${_pkgver}.tar.gz")
sha256sums=('3238443467b01d4011620e7c25c6facd65f3dd507e82c81f44fff6993bc2d3f6')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  tox test -e py
}

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
