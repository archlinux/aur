# Maintainer:  Greg Minshall <minshall at umich dot edu>
pkgname=credeface
pkgver=1.2.9
pkgrel=1
pkgdesc="use git’s credential-cache to hold general passwords"
arch=(any)
url="https://sr.ht/~minshall/credeface/"
license=('MIT')
depends=(git python3)
makedepends=(gawk git asciidoc)
optdepends=('emacs: create and operate on org-mode files')
# git rev-parse 1.2.9 (in upstream repo)
_tag=c1551195124b8576a697c7e663b59886474f5791
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

# sadly, no check() 

package() {
    cd "${pkgname}"

    echo PKGDIR "${pkgdir}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
    # install our MIT license
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
