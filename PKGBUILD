# Maintainer: Frederik “Freso” S. Olesen <archlinux@freso.dk>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=twitch-dl
pkgver=2.3.0
pkgrel=5
pkgdesc="Twitch video downloader that use multiple concurrent connections"
arch=('any')
url="https://github.com/ihabunek/twitch-dl"
license=('GPL3')
depends=(
  ffmpeg
  python-click
  python-httpx
  python-m3u8)
makedepends=(
  python-setuptools
  python-setuptools-scm
  # PEP 517 build requirements
  python-build
  python-installer
  python-wheel)
checkdepends=('python-pytest')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
b2sums=('4ef237c48a57e555bf381b598bdaaa2ac1be9366f3b07b4fa71537b21b65a283af95cbdc4598d34e6443da5ccc690c6c9c77f9f5c87621c90ad905ec51600458')

prepare() {
  cd "$pkgname-$pkgver"
  make clean
}

build() {
  cd "$pkgname-$pkgver"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  make test
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
