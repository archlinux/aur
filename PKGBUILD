# Maintainer: Alexander Fasching <fasching.a91@gmail.com>

pkgname=dwarview-git
_gitname=dwarview
pkgver=r26.79c4132
pkgrel=1
pkgdesc="GUI program that displays DWARF debug info of a file"
arch=('i686' 'x86_64')
url="https://github.com/namhyung/dwarview.git"
license=('GPL')
depends=('libelf' 'gtk3')
source=(git+https://github.com/namhyung/dwarview.git
        gladefile_path.patch)
sha1sums=('SKIP'
          'ea99794a20a1d217d3365ba7369b1c3f2647a509')

pkgver() {
    cd "${srcdir}/${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_gitname}"
    patch -p1 < ../gladefile_path.patch
    make
}

package() {
    cd "${srcdir}/${_gitname}"
    install -Dm755 dwarview "${pkgdir}/usr/bin/dwarview"
    install -Dm644 dwarview.glade "${pkgdir}/usr/share/${_gitname}/dwarview.glade"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
}
