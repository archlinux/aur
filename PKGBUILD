# Maintainer: A. Klitzing <aklitzing@gmail.com>
pkgname=rbtools
_name=RBTools
pkgver=5.0
pkgrel=3
pkgdesc="Client tools for Review Board"
arch=('any')
url="https://www.reviewboard.org/"
license=('custom:MIT')
makedepends=(python-build python-installer python-wheel)
depends=(python python-tqdm python-texttable python-colorama pydiffx python-certifi python-typing_extensions
         python-packaging python-housekeeping python-importlib-metadata python-importlib_resources)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz)
sha256sums=('beb373100d0f2d707370a6ce449b6f98110dd0081accffd766d955cea16f08bc')

build() {
  cd "$srcdir/RBTools-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/RBTools-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

