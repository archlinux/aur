# Maintainer: FFY00 <filipe.lains@gmail.com>
pkgname=mitmproxy-git
_pkgname=${pkgname%-git}
pkgver=4.0.0.r79.3cd37652
pkgrel=1
pkgdesc="An interactive TLS-capable intercepting HTTP proxy."
arch=('any')
url="https://mitmproxy.org/"
license=('MIT')
depends=(
  'python-blinker' 'python-brotlipy' 'python-click' 'python-cryptography' 'python-h11'
  'python-h2' 'python-hyperframe' 'python-kaitaistruct' 'python-ldap3' 'python-passlib'
  'python-pyasn1' 'python-pyopenssl' 'python-pyparsing' 'python-pyperclip' 'python-requests'
  'python-ruamel-yaml' 'python-setuptools' 'python-sortedcontainers' 'python-tornado'
  'python-urwid' 'python-wsproto'
)
conflicts=('mitmproxy')
provides=('mitmproxy')
source=("git+https://github.com/mitmproxy/mitmproxy.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir"/$_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

package() {
  cd "$srcdir"/$_pkgname
  python setup.py install --root="$pkgdir"

  install -dm 644 "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm 644 "$srcdir"/$_pkgname/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
