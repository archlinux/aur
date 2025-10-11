# Maintainer:  Greg Minshall <minshall at umich dot edu>
pkgname=orgtbl-query
pkgver=1.3.1
pkgrel=1
pkgdesc="query the contents of emacs org-mode tables in files"
arch=(any)
url="https://sr.ht/~minshall/orgtbl-query/"
license=('MIT')
depends=(gawk)
makedepends=(git)
optdepends=('emacs: create and operate on org-mode files')
# git rev-parse 1.3.1
_tag=fc97dda7e8f4937dc8f2d2311da87bc912b9f408
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
