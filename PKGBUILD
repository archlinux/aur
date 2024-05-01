# Maintainer:  Greg Minshall <minshall at umich dot edu>
pkgname=org-cli-tangle
pkgver=1.4.2
pkgrel=1
pkgdesc="tangle source code blocks in emacs orgmode files from the command line"
arch=(any)
url="https://sr.ht/~minshall/org-cli-tangle/"
license=('MIT')
# pass is technically "optdepends"; but, the functionality without it
# is minimal
depends=(emacs)
makedepends=(asciidoc gawk git m4)
checkdepends=(cram)
# git rev-parse in upstream repo:
# git rev-parse 1.4.2
_tag=42dbdce5b42cf429a1571f0b44e754ac9e5221c2
source=(git+https://git.sr.ht/~minshall/credeface#tag=${_tag}?signed)
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

    make check
}

package() {
    cd "${pkgname}"

    make DESTDIR="${pkgdir}" PREFIX=/usr install
    # install our MIT license
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
