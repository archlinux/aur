# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>
pkgname=pdfposter-git
_pkgname=pdfposter
pkgver=0.8.1.r27.g2d0ed65
pkgrel=1
pkgdesc="Print large posters on multiple sheets"
arch=('any')
url="https://pdfposter.readthedocs.io"
license=('GPL3')
depends=('python-pypdf2')
makedepends=('python-distribute')
options=(!emptydirs)
source=(git+https://gitlab.com/pdftools/pdfposter.git)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
