# Maintainer:  Greg Minshall <minshall at umich dot edu>
pkgname=credeface
pkgver=1.2.10
pkgrel=1
pkgdesc="use git’s credential-cache to hold general passwords"
arch=(any)
url="https://sr.ht/~minshall/credeface/"
license=('MIT')
depends=(git python3)
makedepends=(asciidoc gawk git)
optdepends=('emacs: create and operate on org-mode files')
# git rev-parse in upstream repo:
# git rev-parse "1.2.10"
_tag=53739c419a181c29bdb91aa2308543184404320a
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

    make DESTDIR="${pkgdir}" PREFIX=/usr install
    # install our MIT license
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
