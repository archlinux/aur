# Maintainer:  Greg Minshall <minshall at umich dot edu>
pkgname=org-cli-tangle
pkgver=0.1.12
pkgrel=1
pkgdesc="tangle source code blocks in Emacs orgmode files from the command line (using Emacs)"
arch=(any)
url="https://sr.ht/~minshall/org-cli-tangle/"
license=('MIT')
# pass is technically "optdepends"; but, the functionality without it
# is minimal
depends=(emacs)
makedepends=(asciidoc gawk git m4)
checkdepends=(cram)
# git rev-parse in upstream repo:
# git rev-parse 0.1.8
_tag=b8798a399f11868f84a526780e7ade3949a582b4
source=(git+https://git.sr.ht/~minshall/org-cli-tangle#tag=${_tag}?signed)
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
