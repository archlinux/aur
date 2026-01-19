# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

pkgname=python-curl-cffi
_name=curl_cffi
pkgver=0.14.0
pkgrel=1
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
source=($url/archive/v$pkgver/$_name-$pkgver.tar.gz)
b2sums=('4bc337255dbfa270ca0bd8cf4756d1859b8950744de943dc757459d6109847331c3e9a3e42b9bda28574af455eeb1b8473de6b8b4edcd0a1b7167f3dea920479')

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
