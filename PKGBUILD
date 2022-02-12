# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-taskipy
_pkgname="${pkgname#python-}"
pkgver=1.10.1
pkgrel=1
pkgdesc="The complementary task runner for Python"
arch=('any')
url="https://github.com/illBeRoy/taskipy"
license=('MIT')
depends=('python' 'python-toml' 'python-psutil' 'python-colorama')
makedepends=('python-build' 'python-poetry' 'python-install')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('ad392ba5522560bfd42a5541d3e2ae5f512eb33c302ab9f3772ffc9c79ddefa72fc549af292e6f54c221def6e58e36be302194f3e1d50ba1feba2edfcdc5f11f')

build() {
  cd "$_pkgname-$pkgver"

  python \
    -m build \
    --wheel \
    --skip-dependency-check \
    --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"

  python \
    -m install \
    --optimize=1 \
    --destdir="$pkgdir" \
    dist/*.whl

  # python sucks
  chmod 755 "$pkgdir"/usr/bin/*

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
