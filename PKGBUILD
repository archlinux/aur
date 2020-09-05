pkgname=(python-napalm)
_pkgname=napalm
pkgver=3.0.0
pkgrel=1
pkgdesc="Network Automation and Programmability Abstraction Layer with Multivendor support"
arch=('any')
url="https://github.com/napalm-automation/napalm"
license=('Apache')
depends=('python' 'python-cffi' 'python-paramiko' 'python-future' 'python-textfsm' 'python-jinja' 'python-netaddr' 'python-pyaml' 'python-netmiko' 'python-junos-eznc' 'python-scp' 'python-lxml' 'python-ciscoconfparse')
makedepends=('python-setuptools')
checkdepends=('python-tox')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('dbc1a187b9b38cd0840a53b4281728852d22b35f59ec6e81e4c97001cb705a0e')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  tox test -e py
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}