# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=concurrent-log-handler
pkgname=python-concurrent-log-handler
pkgver=0.9.19
pkgrel=1
pkgdesc="RotatingFileHandler replacement with concurrency, gzip and Windows support"
arch=('any')
url="https://github.com/Preston-Landers/concurrent-log-handler"
license=('Apache')
depends=('python-portalocker')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/Preston-Landers/concurrent-log-handler/archive/$pkgver.tar.gz")
sha512sums=('109a1bcdc898b5235b4e91f11410bf2e9a4b52a50eb4ea44b82856b5c74ab492add71d8f3374d1e26ac8d74e888f1d3949afd0652c7b2aeeee1080ce99e167b0')

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
