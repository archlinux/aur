# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-evalidate
pkgver=2.0.2
pkgrel=1
pkgdesc='Safe and fast evaluation of untrusted user-supplied python expressions'
arch=(any)
url='https://github.com/yaroslaff/evalidate'
# https://github.com/yaroslaff/evalidate/blob/v2.0.2/setup.py#L19
license=(MIT)
depends=(python)
makedepends=(git python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=("git+$url#tag=v$pkgver")
sha256sums=('d5837fed00018e7cae14b1266f21751cd8f74c9f4bb37d4581e1ceeb54d6f318')

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
