# Maintainer:  Alois Nespor <alium at artixlinux.org>
# Contributor:  M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributor:  speps <speps at aur dot archlinux dot org>
# Contributor:  Anton Bazhenov <anton.bazhenov at gmail>
# Contributor:  Tuan Nguyen
# Contributor:  Farid <farid at archlinux-br dot org>

pkgname=pdfarranger-git
pkgver=r131.4dcb5ef
pkgrel=1
pkgdesc="Helps merge or split pdf documents and rotate, crop and rearrange pages."
arch=('any')
url="https://github.com/jeromerobert/pdfarranger"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'python-cairo' 'poppler-glib' 'python-pypdf2' 'ghostscript')
makedepends=('git')
conflicts=('pdfshuffler' 'pdfshuffler-git')
source=($pkgname::"git+https://github.com/jeromerobert/pdfarranger#commit=${_gitcommit}")
_gitcommit=4dcb5ef8873ff9ff3936d3cb0d49b8fb4f2ca3cf
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

    install -Dm 644 "data/hicolor/scalable/apps/pdfarranger.svg" \
                    "$pkgdir/usr/share/icons/hicolor/scalable/apps/pdfarranger.svg"

    for _size in "16x16" "32x32" "48x48" "256x256" ; do
        install -Dm 644 "data/hicolor/$_size/apps/pdfarranger.png" \
                        "$pkgdir/usr/share/icons/hicolor/$_size/apps/pdfarranger.png"
    done
}
