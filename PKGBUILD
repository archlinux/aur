# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-infomaniak
pkgver=0.2.4
pkgrel=1
pkgdesc="Infomaniak DNS Authenticator plugin for Certbot"
arch=('any')
license=('Apache-2.0')
url="https://github.com/Infomaniak/$pkgname"
depends=('certbot' 'python-requests-mock' 'python-idna')
makedepends=('python-build' 'python-installer' 'python-uv-build' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz/")
sha256sums=('7f0aac57f5210a76e1c319f2a2cd15d9f655794e3faa9716c57a0d70162de148')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir"/$pkgname-$pkgver
  python -m pytest
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
