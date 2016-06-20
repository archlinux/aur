# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: Elena ``of Valhalla'' Grandi <elena.valhalla@gmail.com>
pkgname=pdfposter-git
_pkgname=pdfposter
pkgver=0.6.0.r23.gd800e72
pkgrel=1
pkgdesc="Print large posters on multiple sheets"
arch=('any')
url="https://pythonhosted.org/pdftools.pdfposter/"
license=('GPL3')
depends=('python2-pypdf2')
makedepends=('python2-distribute')
options=(!emptydirs)
source=("git+https://gitlab.com/pdftools/pdfposter.git"
        "overlap.patch::https://gitlab.com/pdftools/pdfposter/uploads/28ed88cc052609338a5081cbb7d6c086/pdfposter.git.d800e72c8deef2f30d0b0c254cc7d5f6138c4839.diff")
sha256sums=('SKIP'
            '5e3da49d56bfe6e25c3ff212e5a53a68ee050f0748923b23ac78136706a97dc4')

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
