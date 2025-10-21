# Maintainer:  Greg Minshall <minshall at umich dot edu>
pkgname=orgtbl-query
pkgver=1.6.4
pkgrel=1
pkgdesc="query the contents of emacs org-mode tables in files"
arch=(any)
url="https://sr.ht/~minshall/orgtbl-query/"
license=('MIT')
depends=(gawk)
makedepends=(asciidoc git)
optdepends=('emacs: create and operate on org-mode files'
           'cram: functional testing framework')
# git rev-parse 1.6.4
_tag=6ed64477fc7e43a15716d93da7dfe8fb4af9bd8e
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

    make
}

check() {
    cd "${pkgname}"

    if cram -h > /dev/null; then
        make test;
    else
        echo "cram(1) not installed; check suppressed"
    fi
}

package() {
    cd "${pkgname}"

    make DESTDIR="${pkgdir}/" install
    # install our MIT license
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
