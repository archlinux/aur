# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=speechmatics-rt
pkgname=python-$_name
pkgver=1.2.2
pkgrel=1
pkgdesc="Speechmatics Real-Time API Client."
arch=('any')
_repo='https://github.com/speechmatics/speechmatics-python-sdk'
url="$_repo/tree/main/sdk/rt"
license=('MIT')
depends=('python'
         'python-websockets'
         'python-typing_extensions')
makedepends=('python-setuptools'
             'python-build'
             'python-installer')
optdepends=('python-aiohttp: jwt')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/rt/v$pkgver.tar.gz")
sha256sums=('a3dc5a301852864a892c17b54e2114916f4bd7aeb80b665f7549e2eb3def98f4')

build() {
  cd "speechmatics-python-sdk-rt-v$pkgver/sdk/rt"
  python -m build --wheel --no-isolation
}

package() {
  cd "speechmatics-python-sdk-rt-v$pkgver/sdk/rt"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 ../../LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
