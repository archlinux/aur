# Maintainer:  Greg Minshall <minshall at umich dot edu>
pkgname=regexy
pkgver=0.4.5
pkgrel=1
pkgdesc="curses program to play with regular expressions"
arch=(any)
url="https://sr.ht/~minshall/regexy/"
license=('MIT')
depends=('glibc')
makedepends=('asciidoctor' 'emacs' 'gawk' 'gengetopt' 'git')
# checkdepends=('valgrind')
# git rev-parse ${pkgver} [copy from above] in upstream repo:
# git rev-parse 0.4.5
_tag=c6a77ead38cfc244a99240ec80b54cc3b46df8c3
source=(git+https://git.sr.ht/~minshall/regexy#tag=${_tag}?signed)
validpgpkeys=(
    BB68C8D3A3D23B9B398FB50AC397C74C54A9EC4F # Greg Minshall <minshall@acm.org>
)
sha256sums=('SKIP')


pkgver() {
    cd "${pkgname}"
    git describe
}

build() {
    cd "${pkgname}"
    make
}

check() {
    cd "${pkgname}"
}

package() {
    cd "${pkgname}"

    make DESTDIR="${pkgdir}" PREFIX=/usr install
    # install our MIT license
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
