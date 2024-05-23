# Maintainer: Turtle Russ <tttturtleruss@gmail.com>
# Contributor: mark.blakeney at bullet-systems dot net
# Contributor: Yuanji <self@gimo.me>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Francois Boulogne <fboulogne at april dot org>

_name=PyPDF2
pkgname=python-pypdf2
pkgver=4.2.0
pkgrel=3
epoch=1
pkgdesc='Python library for manipulating pages of PDF files (legacy v2)'
arch=(any)
url="https://github.com/py-pdf/$_name"
license=(BSD)
depends=(python python-pillow python-cryptography python-pycryptodome python-typing_extensions)
makedepends=(python-setuptools python-build python-installer python-wheel python-flit-core)
source=($_name-$pkgver.tar.gz::"$url/archive/$pkgver.tar.gz")
sha256sums=('4096459bdb19df0231360617f2266d8068a40b9eb202bbea9c54274a320f0c55')

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
