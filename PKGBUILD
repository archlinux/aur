# Maintainer:  Greg Minshall <minshall at umich dot edu>
pkgname=tempstash
pkgver=0.5.1
pkgrel=1
pkgdesc="stash a copy of a file for a specified period of time"
arch=(any)
url="https://sr.ht/~minshall/tempstash/"
license=('MIT')
depends=(jq rsync yq zsh)
makedepends=(asciidoc)
optdepends=('emacs: create and operate on org-mode files'
           'cram: functional testing framework')
# git rev-parse 0.5.1
_tag=9255858d7d06b445ab600ba308ecbd82ceaf5ede
source=(git+https://git.sr.ht/~minshall/tempstash#tag=${_tag}?signed)
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
