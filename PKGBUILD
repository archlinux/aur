# Maintainer: Dmitriy Q <atsip-help at yandex dot ru>

pkgname=python-sphinx-markdown-builder
_pkgname="${pkgname##python-}"
pkgver=0.6.11
pkgrel=1
pkgdesc="A Sphinx extension to add markdown generation support."
arch=('any')
url="https://github.com/liran-funaro/sphinx-markdown-builder"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3a5175543fd68371f96aca9806a3b6e62c407a51a23802ef9a0863eec1f42b20')

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
