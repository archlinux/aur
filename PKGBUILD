# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>
pkgname=pdfposter-git
_pkgname=pdfposter
pkgver=0.7.post1.r7.g0ec90f0
pkgrel=1
pkgdesc="Print large posters on multiple sheets"
arch=('any')
url="https://pdfposter.readthedocs.io"
license=('GPL3')
depends=('python-pypdf2')
makedepends=('python-distribute')
options=(!emptydirs)
source=("git+https://gitlab.com/pdftools/pdfposter.git" "overlap.patch")
sha256sums=('SKIP'
            '100d55d2f198a390347181ce0d6ad33bb4b16d885f1a812367cd7df3e1a2f83f')

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
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
