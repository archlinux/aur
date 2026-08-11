# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-infomaniak
pkgver=0.3.1
pkgrel=1
pkgdesc="Infomaniak DNS Authenticator plugin for Certbot"
arch=('any')
license=('Apache-2.0')
url="https://github.com/Infomaniak/$pkgname"
depends=('certbot' 'python-idna')
makedepends=('python-build' 'python-installer' 'python-uv-build' 'python-wheel')
checkdepends=('python-pytest' 'python-requests-mock' 'python-pytest-ruff')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz/")
sha256sums=('fdf4de24df1728c4634cbd71b768cd81eeb4dd0e1fe1c8d7131df2e48c3f4b83')

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
