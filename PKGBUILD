# Maintainer:  Alois Nespor <alium at artixlinux.org>

pkgname=pdfarranger-git
pkgver=r157.66f1463
pkgrel=1
pkgdesc="Helps merge or split pdf documents and rotate, crop and rearrange pages."
arch=('any')
url="https://github.com/jeromerobert/pdfarranger"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'python-cairo' 'poppler-glib' 'python-pypdf2' 'ghostscript'  'python-setuptools')
makedepends=('git' 'python-distutils-extra')
conflicts=('pdfshuffler' 'pdfshuffler-git' 'pdfarranger')
source=($pkgname::"git+https://github.com/jeromerobert/pdfarranger")
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
    python setup.py install --prefix=/usr --root="$pkgdir/"

    rm -rf "$pkgdir/usr/share/pdfshuffler/icons"

    install -Dm 644 "data/icons/scalable/apps/pdfarranger.svg" \
                    "$pkgdir/usr/share/icons/hicolor/scalable/apps/pdfarranger.svg"

    for _size in "16x16" "32x32" "48x48" "256x256" ; do
        install -Dm 644 "data/icons/$_size/apps/pdfarranger.png" \
                        "$pkgdir/usr/share/icons/hicolor/$_size/apps/pdfarranger.png"
    done
}
