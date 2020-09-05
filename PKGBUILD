pkgname=python-netmiko
_pkgname=netmiko
pkgver=3.1.1
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
sha256sums=('0b2e01cce1f5e7dd1f75a3dcdf415922e3d578233d423a9d8f8a8f6a87fe1167')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  tox test -e py
}

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
