# Maintainer: Benjamin Abadie <benjamin.abadie enix fr>

pkgname=python-napalm-git
_pkgname=napalm
provides=('python-napalm')
conflicts=('python-napalm')
pkgver=r4264.2be389a6
pkgrel=2
pkgdesc="Network Automation and Programmability Abstraction Layer with Multivendor support"
arch=('any')
url="https://github.com/napalm-automation/napalm"
license=('Apache')
depends=('python'
        'python-requests'
        'python-cffi'
        'python-paramiko'
        'python-future'
        'python-textfsm'
        'python-jinja'
        'python-netaddr'
        'python-pyaml'
        'python-netmiko'
        'python-junos-eznc'
        'python-scp'
        'python-lxml'
        'python-ciscoconfparse')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-ddt' 'python-mock')
source=("git+${url}.git")
sha256sums=('SKIP')

check() {
  cd "$_pkgname"
  pytest
}

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
