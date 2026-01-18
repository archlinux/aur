# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=python-curl-cffi
_name=curl_cffi
pkgver=0.13.0
pkgrel=3
pkgdesc="Python binding for curl-impersonate fork via cffi"
arch=(x86_64)
url="https://github.com/lexiforest/$_name"
license=(MIT)
depends=(
  gcc-libs
  glibc
  libcurl-impersonate
  python
  python-certifi
  python-cffi
  python-eventlet
  python-gevent
  python-typing_extensions
  python-orjson
  python-readability-lxml
  python-markdownify
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
  unzip
)
options=(!debug)
source=($url/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('90135e4c782ae3e40da2d66366cbc5921834d016a206e9f4f64998282c783f11a33ee9a283b45c4dc7811bece318b202a3461c2d76873425c2976b0d6a13da77')

prepare() {
  cd $_name-$pkgver
  make preprocess
}

build() {
  cd $_name-$pkgver
  CI=1 python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
