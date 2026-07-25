# Maintainer: Stanislav Senotrusov <senotrusov@gmail.com>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>

pkgname=mdformat-asterisk
pkgver=1.0.0
pkgrel=3
pkgdesc='CommonMark-compliant Markdown formatter patched to swap primary and secondary marker symbols'
arch=(any)
url=https://github.com/senotrusov/mdformat-asterisk
license=(MIT)
depends=(python-markdown-it-py)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
provides=("mdformat=$pkgver")
conflicts=(mdformat)
source=("git+$url.git#tag=$pkgver")
b2sums=('6a4874f2f319903da228e4a2cfb8ceeffc520287c2ff9b23a13dda00719d120668da1dc5d253f9b61c2875db43e6b3d6ed4404000d977ccdaa6a53b00271fd81')

build() {
  cd $pkgname
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $pkgname
  PYTHONPATH=build/lib pytest
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
