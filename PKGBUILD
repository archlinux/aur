# Maintainer: A. Klitzing <aklitzing@gmail.com>
pkgname=rbtools
pkgver=7.0
pkgrel=0
pkgdesc="Client tools for Review Board"
arch=('any')
url="https://www.reviewboard.org/"
license=('custom:MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-appdirs python-typelets pydiffx python-certifi python-typing_extensions
         python-packaging python-housekeeping python-importlib-metadata python-importlib_resources python-puremagic python-rich)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('2e02491f07181a0a1d8faf2bf9f8c7e89eb73fe5ec59a0f7859e1e0bfb4cbf33')

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

