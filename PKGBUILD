# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-infomaniak
pkgver=0.2.1
pkgrel=3
pkgdesc="Infomaniak DNS Authenticator plugin for Certbot"
arch=('any')
license=('Apache')
url="https://pypi.python.org/pypi/$pkgname"
depends=('certbot' 'python-mock' 'python-requests-mock')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('19b148858adf1e816f12bb738b0ae8c64853d6dfede4e1e2aa2fca6ecdff2ddf')

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
