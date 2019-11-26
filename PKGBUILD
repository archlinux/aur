# Maintainer: Michael Borders <michael.a.borders@gmail.com>

pkgname=(python-napalm)
_pkgname=napalm
pkgver=2.5.0
pkgrel=2
pkgdesc="Network Automation and Programmability Abstraction Layer with Multivendor support"
arch=('any')
url="https://github.com/napalm-automation/napalm"
license=('Apache')
depends=('python' 'python-cffi' 'python-paramiko' 'python-future' 'python-textfsm' 'python-jinja' 'python-netaddr' 'python-pyaml' 'python-netmiko' 'python-junos-eznc' 'python-scp' 'python-lxml' 'python-ciscoconfparse')
makedepends=('python-setuptools')
checkdepends=('python-tox')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('c30254303f0d908f64902d89ea73673a922d3a27f94c2af674264a1b5a230249')

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  tox test -e py
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}