# Maintainer:  Alois Nespor <alium at artixlinux.org>

pkgname=pdfarranger
pkgver=1.0
pkgrel=1
pkgdesc="Helps merge or split pdf documents and rotate, crop and rearrange pages."
arch=('any')
url="https://github.com/jeromerobert/pdfarranger"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'python-cairo' 'poppler-glib' 'python-pypdf2' 'ghostscript')
makedepends=('python-distutils-extra' 'python-setuptools')
conflicts=('pdfshuffler' 'pdfshuffler-git' 'pdfarranger-git')
source=(https://github.com/jeromerobert/pdfarranger/archive/$pkgver.tar.gz)

build () {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package () {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/"

    rm -rf "$pkgdir/usr/share/pdfshuffler/icons"

    install -Dm 644 "data/icons/scalable/apps/pdfarranger.svg" \
                    "$pkgdir/usr/share/icons/hicolor/scalable/apps/pdfarranger.svg"

    for _size in "16x16" "32x32" "48x48" "256x256" ; do
        install -Dm 644 "data/icons/$_size/apps/pdfarranger.png" \
                        "$pkgdir/usr/share/icons/hicolor/$_size/apps/pdfarranger.png"
    done
}

sha256sums=('d4bdc60b2a14ca7d8545016a1fda5ca00859a6e576c087c7c6af58c04c0b7624')
