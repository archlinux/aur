# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=python-taskipy
_pkgname="${pkgname#python-}"
pkgver=1.10.0
pkgrel=1
pkgdesc="The complementary task runner for Python"
arch=('any')
url="https://github.com/illBeRoy/taskipy"
license=('MIT')
depends=('python' 'python-toml' 'python-psutil' 'python-colorama')
makedepends=('python-build' 'python-poetry' 'python-install')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('61aabf75b65d2f86a62faa92b985557343dfc9d80e8018f07d84a0d4582ba17082880616985148cbe82c3bcc07657a74b4e30c6da3ea00ccd413e3e46b1633bf')

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
