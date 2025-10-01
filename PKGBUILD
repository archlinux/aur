# Maintainer:  Greg Minshall <minshall at umich dot edu>
pkgname=csvedepli
pkgver=0.2.7
pkgrel=2
pkgdesc="grep- and sed-like programs for .csv files"
arch=(any)
url="https://sr.ht/~minshall/csvedepli/"
license=('MIT')
depends=('glibc')
makedepends=('emacs' 'gawk' 'gengetopt' 'git' 'sed')
checkdepends=('cram')
# git rev-parse ${pkgver} [copy from above] in upstream repo:
# git rev-parse 0.2.6
_tag=39c3753aead4a81a0b19c4e44bdd7f38ab874201
source=(git+https://git.sr.ht/~minshall/csvedepli#tag=${_tag}?signed)
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
