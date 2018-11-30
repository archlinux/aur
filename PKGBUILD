# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>
pkgname=pdfposter-git
_pkgname=pdfposter
pkgver=0.7.post1.r4.g6617424
pkgrel=1
pkgdesc="Print large posters on multiple sheets"
arch=('any')
url="https://pdfposter.readthedocs.io"
license=('GPL3')
depends=('python2-pypdf2')
makedepends=('python2-distribute')
options=(!emptydirs)
source=("git+https://gitlab.com/pdftools/pdfposter.git" "overlap.patch")
sha256sums=('SKIP'
            '002e33a4899e92692119588cd79c0be2e3fab80b75421088a14d14d4921efcb1')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  msg "Patching overlap (https://gitlab.com/pdftools/pdfposter/issues/1) ..."
  patch -p1 < "$srcdir"/overlap.patch
}

build() {
  cd "$srcdir/$_pkgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
