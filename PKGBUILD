# Maintainer:
# Contributor: corrad1nho <corrado@posteo.net>

pkgname=qomui
pkgver=0.8.2
pkgrel=3
pkgdesc="Qt OpenVPN Management UI"
url="https://github.com/corrad1nho/qomui"
license=("GPL-3.0-or-later")
arch=("x86_64")

depends=(
  'bind-tools'
  'openvpn'
  'python-beautifulsoup4'
  'python-cryptography'
  'python-dbus'
  'python-lxml'
  'python-pexpect'
  'python-psutil'
  'python-pyqt5'
  'python-requests'
  'stunnel'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'dnsmasq: bypass OpenVPN'
  'geoip: identify server locations'
  'libcgroup: bypass OpenVPN'
  'openresolv: wireguard'
  'wireguard-tools: wireguard'
)

_pkgsrc="$pkgname-$pkgver"
source=("https://github.com/corrad1nho/qomui/archive/v$pkgver.tar.gz")
sha256sums=("78187864a4368fed06f6e58c4d411053a1d1193d625ee79be0a57bf0938b1d0b")

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
