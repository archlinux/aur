# Maintainer:  Greg Minshall <minshall at umich dot edu>
pkgname=pacjson
pkgver=0.2.0
pkgrel=1
pkgdesc="produce a JSON representation of pacman \"-S\" and/or \"-Q\" databases"
arch=(any)
url="https://sr.ht/~minshall/pacjson/"
license=('MIT')
# pass is technically "optdepends"; but, the functionality without it
# is minimal
depends=('pyalpm' 'python>=3.0')
makedepends=('asciidoc' 'emacs' 'gawk' 'git' 'm4')
checkdepends=()
# git rev-parse in upstream repo:
# git rev-parse 0.2.0

_tag=68bd7d6e9d013470eb801535f23294c072ca77ac
source=(git+https://git.sr.ht/~minshall/pacjson#tag=${_tag}?signed)
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
