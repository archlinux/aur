# Maintainer:  Birk Birkner <aur at bbirkner.de>
# Contributor:  Alois Nespor <alium at artixlinux.org>

pkgname=pdfarranger-git
pkgver=1.10.0.r1040.4c352e4
pkgrel=1
pkgdesc="Helps merge or split pdf documents and rotate, crop and rearrange pages."
arch=('any')
url="https://github.com/pdfarranger/pdfarranger"
license=('GPL3')
depends=(gtk3 python-gobject python-cairo python-pikepdf python-dateutil ghostscript python-setuptools poppler-glib)
makedepends=(git)
optdepends=(
    'img2pdf: support for image files'
    'libhandy: alternate graphics backend'
)
conflicts=('pdfshuffler' 'pdfshuffler-git' 'pdfarranger')
provides=('pdfarranger')
source=($pkgname::"git+https://github.com/pdfarranger/pdfarranger")
md5sums=('SKIP')

pkgver () {
    cd "$srcdir/$pkgname"
    printf "%s.r%s.%s" "$(python setup.py --version)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package () {
    cd "$srcdir/$pkgname"
    python setup.py install --prefix=/usr --root="$pkgdir"
}
