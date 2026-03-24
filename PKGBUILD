# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
pkgname="python-jwt"
pkgver=1.4.0
pkgrel=1
pkgdesc="JSON Web Token library for Python"
arch=(any)
url="https://github.com/GehirnInc/$pkgname"
license=('Apache-2.0')
depends=(
  'python>=3.9'
  'python-cryptography>=3.1'
)
makedepends=(
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools>=69.0.0'
)
checkdepends=(
  'python-pytest>=6.0'
  'python-freezegun'
)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('49de9c87bce7ee35b2bd04ecdc54c25ece9f63ef98527d6ed126fa98de667e8e29f9cd8ca90e26a415b47569f3c1edcc7c05ae89a26e7f5fdf96282e6c080334')

build() {
  cd "$pkgname-$pkgver"
  python -m build -wnx
}

check() {
  cd "$pkgname-$pkgver"
  pytest
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer -d "$pkgdir/" dist/*.whl
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
