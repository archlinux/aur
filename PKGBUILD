# Maintainer:  Birk Birkner <aur at bbirkner.de>

pkgname=pdfarranger-git
pkgver=r821.d0f5979
pkgrel=2
pkgdesc="Helps merge or split pdf documents and rotate, crop and rearrange pages."
arch=('any')
url="https://github.com/pdfarranger/pdfarranger"
license=('GPL3')
depends=(gtk3 python-gobject python-cairo python-pikepdf python-dateutil ghostscript python-setuptools poppler-glib)
makedepends=(git python-distutils-extra)
optdepends=('img2pdf: support for image files')
conflicts=('pdfshuffler' 'pdfshuffler-git' 'pdfarranger')
source=($pkgname::"git+https://github.com/pdfarranger/pdfarranger")
md5sums=('SKIP')

pkgver () {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package () {
    cd "$srcdir/$pkgname"
    python setup.py install --prefix=/usr --root="$pkgdir"
}
