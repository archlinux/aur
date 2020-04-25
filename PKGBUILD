# Maintainer: Michael Borders <dev@michaelborders.net>

pkgname=python-netmiko
_pkgname=netmiko
pkgver=3.1.0
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="Multi-vendor library to simplify Paramiko SSH connections to network devices"
arch=('any')
url="https://github.com/ktbyers/netmiko"
license=('MIT')
depends=('python' 'python-paramiko' 'python-scp' 'python-pyserial' 'python-textfsm')
makedepends=('python-setuptools')
checkdepends=('python-tox')
source=("${url}/archive/${_pkgver}.tar.gz")
sha256sums=('4e2957642608ca29ac86078d938d77094864847a58faf99bae24ae01e231111d')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  tox test -e py
}

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
