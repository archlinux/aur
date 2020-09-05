pkgname=(python-napalm)
_pkgname=napalm
pkgver=3.1.0
pkgrel=1
pkgdesc="Network Automation and Programmability Abstraction Layer with Multivendor support"
arch=('any')
url="https://github.com/napalm-automation/napalm"
license=('Apache')
depends=('python' 'python-cffi' 'python-paramiko' 'python-future' 'python-textfsm' 'python-jinja' 'python-netaddr' 'python-pyaml' 'python-netmiko' 'python-junos-eznc' 'python-scp' 'python-lxml' 'python-ciscoconfparse')
makedepends=('python-setuptools')
checkdepends=('python-tox')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('d711f273e12478db35982a36e7128cf63caae90ec4fef2c9a12a92b21998d59a')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  tox test -e py
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}