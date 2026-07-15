# Maintainer: Xeonacid <h.dwwwwww@gmail.com>

_name=pytsk3
pkgname=python-${_name}
pkgver=20260715
pkgrel=1
pkgdesc="Python bindings for The Sleuth Kit (libtsk)"
arch=(x86_64)
url="https://github.com/py4n6/pytsk"
license=(Apache-2.0)
depends=(gcc-libs glibc python sleuthkit)
makedepends=(git python-build python-installer python-setuptools python-wheel)
# Upstream git source is incomplete
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('f24f63d0a488affbbcaeb96e68a7655f90ecde3872e7ce6abeed2cf359e70953a56f60b58e46947a45f0de8c1c3073b917aa70570be31222da028d3ada1ea8d5')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README -t "$pkgdir/usr/share/doc/$pkgname"
}
