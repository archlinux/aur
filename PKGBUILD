# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-python-lorem
_name=${pkgname#python-python-}
pkgver=1.3.0.post3
pkgrel=1
pkgdesc="Pythonic lorem ipsum generator"
arch=('any')
url="https://jarryshaw.github.io/lorem"
license=('BSD 3-Clause')
depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-pytest'
)
source=("$_name-$pkgver.tar.gz::https://github.com/JarryShaw/lorem/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9ab34c475e08a0131242d6cbf6a97b1d3b683836eb287761424ff820e9a02aa0')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
