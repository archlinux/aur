# Maintainer: A. Klitzing <aklitzing@gmail.com>
pkgname=rbtools
pkgver=6.0
pkgrel=0
pkgdesc="Client tools for Review Board"
arch=('any')
url="https://www.reviewboard.org/"
license=('custom:MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-tqdm python-texttable python-colorama pydiffx python-certifi python-typing_extensions
         python-packaging python-housekeeping python-importlib-metadata python-importlib_resources python-puremagic)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('6cef4170edafbb0d804c61b208dbc4d4685b8e654b98b667ae084ac610a66db4')

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

