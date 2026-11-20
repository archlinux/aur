# Maintainer: Smoolak <smoolak@gmail.com>
pkgname=python-assoc-scan
pkgver=0.0.6
pkgrel=1
pkgdesc='Associative scan in PyTorch with optional GPU acceleration'
arch=(any)
url='https://github.com/lucidrains/assoc-scan'
license=(MIT)
depends=('python-accelerated-scan>=0.3.0' 'python-einops>=0.8.0' 'python-pytorch>=2.0')
makedepends=(python-build python-setuptools python-wheel python-installer)
checkdepends=(python-pytest)
_commit=d1d628b09ea7306e88dd86e11c53eae4be16d9ed
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('052918749329ae77c11b181c08bc1ae2cbef8032f7f97da41eb6d00203a46816')

build() {
  cd "assoc-scan-$_commit"
  python -m build --wheel --no-isolation
}

check() {
  cd "assoc-scan-$_commit"
  python -m pytest tests
}

package() {
  cd "assoc-scan-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
