# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python38-aioitertools
_pkgname=aioitertools
# https://github.com/omnilib/aioitertools/blob/main/CHANGELOG.md
pkgver=0.11.0
pkgrel=1
pkgdesc='Implementation of itertools, builtins, and more for AsyncIO and mixed-type iterables'
arch=(any)
url='https://github.com/omnilib/aioitertools'
license=(MIT)
depends=(python38)
makedepends=(python38-flit-core python38-build python38-installer)
source=("https://files.pythonhosted.org/packages/source/a/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('42c68b8dd3a69c2bf7f2233bf7df4bb58b557bca5252ac02ed5187bbc67d6831')

build() {
  cd $_pkgname-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver
  python3.8 -m unittest -v aioitertools.tests
}

package() {
  cd $_pkgname-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
