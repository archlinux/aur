# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Daniel Moch <daniel@danielmoch.com>

pkgname=python-halcy-blurhash
_pkg=blurhash
pkgver=1.1.4
pkgrel=1
pkgdesc='Pure Python implementation of the blurhash algorithm'
arch=('any')
url="https://github.com/woltapp/blurhash-python"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
# checkdepends=('python-pytest' 'python-pillow' 'python-numpy')
provides=('python-blurhash')
conflicts=('python-blurhash')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/b/$_pkg/$_pkg-$pkgver.tar.gz"
        'LICENSE')
sha256sums=('da56b163e5a816e4ad07172f5639287698e09d7f3dc38d18d9726d9c1dbc4cee'
            'b8eac7c273126370c3d04ecc12ea38f998ef93aa72943feb2204b2b68c330355')

build() {
  cd "$_pkg-$pkgver"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "$_pkg-$pkgver"
#   pytest
# }

package() {
  cd "$_pkg-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dvm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: set sts=2 sw=2 ft=PKGBUILD et:
