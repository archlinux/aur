# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>

_name=cppyy
pkgname=python-$_name
pkgver=3.5.0
pkgrel=1
pkgdesc="Python-C++ bindings interface based on Cling/LLVM"
arch=(any)
url="https://cppyy.readthedocs.io/en/latest/index.html"
license=(BSD-3-Clause-LBNL)
depends=(
  python
  # https://github.com/wlav/cppyy/blob/master/setup.py#L26
  python-cppyy-backend=1.15.3
  python-cppyy-cling=6.32.8
  python-cpycppyy=1.13.0
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  'python-numba: Numba support'
)
provides=($_name)
replaces=($_name)
source=(
  https://github.com/wlav/cppyy/archive/refs/tags/$_name-$pkgver.tar.gz
)
b2sums=('3751a33ce49246ac16e785c3ef768fc762cccc60c00edba9c4539c0d0a1becf03ab23cebd5efee5aa196c7c0240a7808a49d0998ed0d40f6377a2525792ed5bf')

build() {
  cd $_name-$_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
