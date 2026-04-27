# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-curl-adapter
_name=${pkgname#python-}
pkgver=1.2.1
pkgrel=1
pkgdesc="A curl HTTP adapter switch for requests library — make browser-like requests with custom TLS fingerprints."
arch=('any')
url="https://github.com/el1s7/curl-adapter"
license=('MIT')
depends=(
  'python-brotli'
  'python-curl_cffi'
  'python-pycurl'
  'python-requests'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('83a9b880dbf7afdcb01682874cb55fec2427f4e2c6cbbed1af694c71983e5ef4')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
