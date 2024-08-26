# Maintainer:  Greg Minshall <minshall at umich dot edu>
pkgname=credeface
pkgver=1.4.3
pkgrel=1
pkgdesc="use git’s credential-cache to hold general passwords"
arch=(any)
url="https://sr.ht/~minshall/credeface/"
license=('MIT')
# pass is technically "optdepends"; but, the functionality without it
# is minimal
depends=(git pass python3)
makedepends=(asciidoc gawk git)
checkdepends=(cram python-coverage)
# git rev-parse in upstream repo:
# git rev-parse 1.4.3
_tag=2ba77187fa836456bff98546b3e16f4f32e5a156
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
