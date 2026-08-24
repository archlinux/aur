# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-infomaniak
pkgver=0.3.3
pkgrel=1
pkgdesc="Infomaniak DNS Authenticator plugin for Certbot"
arch=('any')
license=('Apache-2.0')
url="https://github.com/Infomaniak/$pkgname"
depends=('certbot' 'python-idna' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-uv-build' 'python-wheel')
checkdepends=('python-pytest' 'python-requests-mock' 'python-pytest-ruff')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz/")
sha256sums=('59cbe89409fa803103b95bf5f34088b59a01a0a63a19b6415feb7966e4f9d0ef')

prepare() {
  sed -i 's/"uv_build>=0.0.0,<0.12"/"uv_build"/' "$srcdir"/$pkgname-$pkgver/pyproject.toml
}

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
