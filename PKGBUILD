# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-steam
_name=${pkgname#python-}
pkgver=1.4.4
pkgrel=2
pkgdesc="Python package for interacting with Steam"
arch=('any')
url="https://github.com/ValvePython/steam"
license=('MIT')
depends=('python' 'python-cachetools' 'python-pycryptodomex' 'python-requests'
         'python-six' 'python-vdf')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8c7ff6dcfe90b8b40f631d9048fb608201ae356421f440674cc00dde95c1d8b5')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
