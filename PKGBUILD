# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-curl-adapter
_name=${pkgname#python-}
pkgver=1.2.0
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
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6ce0f60c2be63e3f6a64e171392ec1eb8fd442d33329343664d7112e5856d755')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
