# Maintainer: Dmitriy Q <atsip-help at yandex dot ru>

pkgname=python-sphinx-markdown-builder
_pkgname="${pkgname##python-}"
pkgver=0.6.9
pkgrel=3
pkgdesc="A Sphinx extension to add markdown generation support."
arch=('any')
url="https://github.com/liran-funaro/sphinx-markdown-builder"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3db94918c25955eed834037140a4f012e8f01919331e86344b2bb2b164d51915')

depends=(
  'python'
  'python-markdown'
  'python-sphinx'
)

makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
