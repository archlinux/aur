# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-evalidate
# https://github.com/yaroslaff/evalidate/releases
pkgver=2.0.3
pkgrel=1
pkgdesc='Safe and fast evaluation of untrusted user-supplied python expressions'
arch=(any)
url='https://github.com/yaroslaff/evalidate'
# https://github.com/yaroslaff/evalidate/blob/v2.0.2/setup.py#L19
license=(MIT)
depends=(python)
makedepends=(git python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest)
source=("git+$url#tag=v$pkgver")
sha256sums=('c72b662d3b462383fcd161836ba6fa9c4a23b1041c57e8b365fd352a3db40cd6')

build() {
  cd evalidate
  python -m build --wheel --no-isolation
}

check() {
  cd evalidate
  PYTHONPATH="$PWD" pytest tests
}

package() {
  cd evalidate
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
