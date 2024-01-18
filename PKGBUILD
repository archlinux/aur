pkgname=python-wyoming
_pkgname=wyoming
pkgdesc="Peer-to-peer protocol for voice assistants"
pkgver=1.5.2
pkgrel=1
arch=(any)
url="https://github.com/rhasspy/wyoming"
license=('MIT')
depends=(python)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-zeroconf: Zeroconf support')
source=("https://github.com/rhasspy/wyoming/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('00b9129a7af8d44297398690199f874183ffe0c62399283e07768915c1c8518b')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
