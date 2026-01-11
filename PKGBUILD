# Maintainer:  Berrit Birkner <aur at bbirkner.de>
# Contributor:  Alois Nespor <alium at artixlinux.org>

pkgname=pdfarranger-git
pkgver=1.12.1.r1290.5b57e3c
pkgrel=2
pkgdesc="Helps merge or split pdf documents and rotate, crop and rearrange pages."
arch=('any')
url="https://github.com/pdfarranger/pdfarranger"
license=('GPL-3.0-or-later')
depends=('gtk3'
    'python-gobject'
    'python-cairo'
    'python-pikepdf'
    'python-dateutil'
    'ghostscript'
    'poppler-glib'
    'python-importlib-metadata'
)
makedepends=('git'
    'python-installer'
    'python-setuptools'
    'python-build'
    'python-wheel'
)
optdepends=(
    'img2pdf: support for image files'
    'libhandy: alternate graphics backend'
)
conflicts=('pdfshuffler' 'pdfshuffler-git' 'pdfarranger')
provides=('pdfarranger')
source=($pkgname::"git+https://github.com/pdfarranger/pdfarranger.git")
md5sums=('SKIP')

pkgver () {
    cd "$srcdir/$pkgname"
    _VERSION="$(python setup.py --version)"
    printf "%s.r%s.%s" "$_VERSION" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package () {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
