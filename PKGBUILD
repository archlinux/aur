# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-evalidate
# https://github.com/yaroslaff/evalidate/releases
pkgver=2.0.5
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
sha256sums=('046b7259659b405e76d843ef1f9dda9909c7e3a0196b1c9339d3f46830bbc447')

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
