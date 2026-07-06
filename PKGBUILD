# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Chris Warrick <aur@chriswarrick.com>

pkgname=python-bbcode
pkgver=1.3.0
pkgrel=1
_commit=94385a10f95a3afb58d41afff623ad72aa82e7cc
pkgdesc='A pure Python BBCode parser and formatter.'
arch=(any)
url='https://github.com/dcwatson/bbcode'
license=(BSD-2-Clause)
depends=(python)
makedepends=(python-build python-installer python-uv-build python-wheel)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('bc77fb9da8d3a90162cbadb532e913d344dec4fb7b0fe92782ff352347e2cb1d')

prepare() {
  cd "bbcode-$_commit"
  sed -i '/requires =/c\requires = ["uv_build"]' pyproject.toml
}

build() {
  cd "bbcode-$_commit"
  python -m build --wheel --no-isolation
}

package() {
  cd "bbcode-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
