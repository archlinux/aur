# Maintainer: mark.blakeney at bullet-systems dot net
# Contributor: Yuanji <self@gimo.me>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

_name=PyPDF2
pkgname=python-pypdf2
pkgver=2.12.1
pkgrel=2
epoch=1
pkgdesc='Python library for manipulating pages of PDF files (legacy v2)'
arch=(any)
url="https://github.com/py-pdf/$_name"
license=(BSD)
depends=(python)
makedepends=(python-setuptools python-build python-installer python-wheel python-flit-core)
source=($pkgname-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('40743764b367c43357546fd10d39f288a3a9c520e043f75eea7a1b78ccc38d3f')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

prepare() {
   mv pypdf-$pkgver $_name-$pkgver
}

package(){
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
