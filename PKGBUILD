# Maintainer: Dmitriy Q <atsip-help at yandex dot ru>

pkgname=python-sphinx-markdown-builder
_pkgname="${pkgname##python-}"
pkgver=0.6.10
pkgrel=1
pkgdesc="A Sphinx extension to add markdown generation support."
arch=('any')
url="https://github.com/liran-funaro/sphinx-markdown-builder"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cbae24373d4bae88e480bbb6e55280601a48c9a85393b39e09169b08d06d793f')

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
