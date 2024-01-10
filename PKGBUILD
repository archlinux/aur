# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=concurrent-log-handler
pkgname=python-concurrent-log-handler
pkgver=0.9.25
pkgrel=4
pkgdesc="RotatingFileHandler replacement with concurrency, gzip and Windows support"
arch=('any')
url="https://github.com/Preston-Landers/concurrent-log-handler"
license=('Apache')
depends=('python-portalocker')
makedepends=('python-build' 'python-path' 'python-hatchling' 'python-installer')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/Preston-Landers/concurrent-log-handler/archive/$pkgver.tar.gz")
sha256sums=('69a0ef00b4e6b8a773c97c1fab05a93bc8669c0f5be53256f5b4a8a06229d92d')

build() {
  cd "$_pkgname-$pkgver" || exit
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
