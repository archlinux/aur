# Maintainer: piernov <piernov@piernov.org>

pkgname=python-pep517
pkgver=0.13.0
pkgrel=3
pkgdesc='Wrappers to build Python packages using PEP 517 hooks'
arch=('any')
url='https://github.com/pypa/pep517'
license=('MIT')
depends=('python')
makedepends=('python-flit-core' 'python-build' 'python-installer')
checkdepends=('python-pytest' 'python-testpath')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pep517/pep517-$pkgver.tar.gz"
        "a29513a03d60a90c048ad9281dd7e897bd6f40b1.patch")
sha256sums=('ae69927c5c172be1add9203726d4b84cf3ebad1edcd5f71fcdc746e66e829f59'
            '0676bad1483c869ececfb050b50005b102f0b9f17210993410355b7e64797efa')

prepare() {
  cd "pep517-$pkgver"
  patch -p1 < "${srcdir}/a29513a03d60a90c048ad9281dd7e897bd6f40b1.patch"
}

build() {
  cd "pep517-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "pep517-$pkgver"
  PYTHONPATH=./src pytest -x --disable-warnings
}

package() {
  export PYTHONHASHSEED=0
  cd "pep517-$pkgver"
  python -m installer --destdir="$pkgdir/" dist/*.whl
}

# vim:set ts=2 sw=2 et:
