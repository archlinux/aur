# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-steam
_name=${pkgname#python-}
pkgver=1.6.1
pkgrel=1
pkgdesc="Python package for interacting with Steam"
arch=('any')
url="https://github.com/solsticegamestudios/steam"
license=('MIT')
depends=(
  'python'
  'python-cachetools'
  'python-pycryptodomex'
  'python-requests'
  'python-six'
  'python-vdf'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dcc305f11e1686a3557cd87afdc50ce177a5015ba3fdd51bef63c7302dd21b05')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
