# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-infomaniak
pkgver=0.3.2
pkgrel=1
pkgdesc="Infomaniak DNS Authenticator plugin for Certbot"
arch=('any')
license=('Apache-2.0')
url="https://github.com/Infomaniak/$pkgname"
depends=('certbot' 'python-idna' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-uv-build' 'python-wheel')
checkdepends=('python-pytest' 'python-requests-mock' 'python-pytest-ruff')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz/")
sha256sums=('d3512a8c7a6184ca9df6633a2fa21e251ed37b0e9eadd4eb8fad2e95f6fbfa1c')

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
