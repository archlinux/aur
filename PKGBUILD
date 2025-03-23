# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=certbot-dns-standalone
pkgver=1.2
pkgrel=1
pkgdesc="Standalone DNS server plugin for certbot verification"
arch=('any')
depends=('certbot' 'python-acme' 'python-dnslib')
makedepends=('python-setuptools')
checkdepends=('python-mock')
url="https://github.com/siilike/$pkgname"
license=('Apache-2.0')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('9a6c9f92d9525ad4fa0c13e14cc23ac2f10d6183cfc3b52e79603469a4d279b3')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  python -m unittest certbot_dns_standalone/dns_standalone_test.py
}
