# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-steam-solstice
_name=steam
pkgver=1.6.0
pkgrel=1
pkgdesc="Python package for interacting with Steam (Solstice Game Studios fork)"
arch=('any')
url="https://github.com/solsticegamestudios/steam"
license=('MIT')
depends=(
  'python'
  'python-cachetools'
  'python-pycryptodomex'
  'python-requests'
  'python-six'
  'python-vdf-solstice'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
provides=('python-steam')
conflicts=('python-steam')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c10de83c25caed1202093584b1d3cbcbc8fedb9aada11930589bb815bfdf51fe')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
