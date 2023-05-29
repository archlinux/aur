# Maintainer:
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=ddupes
pkgver=2.3
pkgrel=3
pkgdesc="Extends fdupes action to directories. Includes ffdupes (fast fdupes)."
arch=(any)
url="https://pietrobattiston.it/ddupes"
license=('GPL3')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=(
  "${pkgname}-${pkgver}.tar.gz"::"https://pietrobattiston.it/_media/${pkgname}:${pkgname}-${pkgver}.tar.gz"
)
sha1sums=(
  '2e5667da75a12e27634a6d4ca6133775bf1d7c0d'
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  2to3 -w ddupes
  2to3 -w ffdupes
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
