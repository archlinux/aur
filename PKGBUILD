# Maintainer: A. Klitzing <aklitzing@gmail.com>
pkgname=rbtools
pkgver=5.1.1
pkgrel=1
pkgdesc="Client tools for Review Board"
arch=('any')
url="https://www.reviewboard.org/"
license=('custom:MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-tqdm python-texttable python-colorama pydiffx python-certifi python-typing_extensions
         python-packaging python-housekeeping python-importlib-metadata python-importlib_resources python-puremagic)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('b6017ff512547d5c04f9449d8ea42e151dbf255728c12efa24bd93c57df5b3e4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

