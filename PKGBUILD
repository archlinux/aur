# Maintainer:  Greg Minshall <minshall at umich dot edu>
pkgname=orgtbl-query
pkgver=1.2.0
pkgrel=1
pkgdesc="query the contents of emacs org-mode tables in files"
arch=(any)
url="https://sr.ht/~minshall/orgtbl-query/"
license=('MIT')
depends=(gawk)
makedepends=(git)
optdepends=('emacs: create and operate on org-mode files')
_tag=b44cd466efc3d98f659a2d4dc3ce6cc1aac9299d # git rev-parse 1.2.0
source=(git+https://git.sr.ht/~minshall/orgtbl-query#tag=${_tag}?signed)
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

    ./configure --prefix=/usr
    make
}

check() {
    cd "${pkgname}"

    make test
}

package() {
    cd "${pkgname}"

    make DESTDIR="${pkgdir}/" install
    # install our MIT license
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
