# Maintainer: librewish <librewish at gmail dot com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=qomui-git
pkgver=0.8.2.r22.23650ab
pkgrel=3
pkgdesc="Qt OpenVPN Management UI"
arch=('x86_64')
url="https://github.com/corrad1nho/qomui"
license=('GPL3')
depends=('python-pyqt5' 'python-dbus' 'openvpn' 'stunnel' 'bind-tools'
         'python-psutil' 'python-requests' 'python-lxml' 'python-beautifulsoup4'
         'python-pexpect' 'wireguard-tools' 'python-cryptography')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('geoip: to identify server locations'
            'dnsmasq: required for bypassing OpenVPN'
            'libcgroup: required for bypassing OpenVPN'
            'iptables: required for bypassing OpenVPN')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/corrad1nho/qomui.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
