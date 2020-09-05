pkgname=(python-napalm)
_pkgname=napalm
pkgver=3.0.1
pkgrel=1
pkgdesc="Network Automation and Programmability Abstraction Layer with Multivendor support"
arch=('any')
url="https://github.com/napalm-automation/napalm"
license=('Apache')
depends=('python' 'python-cffi' 'python-paramiko' 'python-future' 'python-textfsm' 'python-jinja' 'python-netaddr' 'python-pyaml' 'python-netmiko' 'python-junos-eznc' 'python-scp' 'python-lxml' 'python-ciscoconfparse')
makedepends=('python-setuptools')
checkdepends=('python-tox')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('a2d159e91a2d1355fc1eed323a189981999f99776d15c628a8b6aba822fb855a')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  tox test -e py
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}