# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=concurrent-log-handler
pkgname=python-concurrent-log-handler
pkgver=0.9.24
pkgrel=1
pkgdesc="RotatingFileHandler replacement with concurrency, gzip and Windows support"
arch=('any')
url="https://github.com/Preston-Landers/concurrent-log-handler"
license=('Apache')
depends=('python-portalocker')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/Preston-Landers/concurrent-log-handler/archive/$pkgver.tar.gz")
sha256sums=('00f5646c6e5f6fc63654536f3b44aaa2b9b74b23245e14f5258ed91ce39d12e2')

build() {
  cd "$_pkgname-$pkgver" || exit
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver" || exit

  export PYTHONHASHSEED=0
  python setup.py install --skip-build \
      --optimize=1 \
      --prefix=/usr \
      --root="$pkgdir"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
