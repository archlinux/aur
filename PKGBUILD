# Maintainer: Xeonacid <h.dwwwwww@gmail.com>

_name=pytsk3
pkgname=python-${_name}
pkgver=20260702
pkgrel=1
pkgdesc="Python bindings for The Sleuth Kit (libtsk)"
arch=(x86_64)
url="https://github.com/py4n6/pytsk"
license=(Apache-2.0)
depends=(gcc-libs glibc python sleuthkit)
makedepends=(git python-build python-installer python-setuptools python-wheel)
# Upstream git source is incomplete
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('12d709148e2f4d280707213d9fcd237666ee12b66487a87af7ea86060cf8209d9ee78ccff6f47871ed5b5b57eae2ba490eda2a3185ef3bb58174d6b9c42ed172')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README -t "$pkgdir/usr/share/doc/$pkgname"
}
