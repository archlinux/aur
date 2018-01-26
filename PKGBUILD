# Maintainer: nerflad <nerflad@gmail.com>

pkgname=ocaml-biniou
_oname=biniou
pkgver=1.2.0
pkgrel=2
pkgdesc='A binary data serialization format inspired by JSON'
arch=('i686' 'x86_64' 'armv7h')
options=('!strip' '!makeflags' 'staticlibs')
license=('BSD')
depends=('glibc')
makedepends=('ocaml-easy-format' 'ocaml-findlib' 'jbuilder')
url="https://github.com/mjambon/biniou"
source=("https://github.com/mjambon/${_oname}/archive/v${pkgver}.tar.gz")
sha256sums=('d939a9d58660201738c3d22ad5b7976deb2917b22591a07525807bb741357d36')
build() {
    cd ${srcdir}/${_oname}-${pkgver}
    make all
}

package() {
    cd ${srcdir}/${_oname}-${pkgver}
    export OPAMROOT="${srcdir}/.opam"
    opam init -n
    mkdir -p "${pkgdir}/usr/bin"
    export OCAMLFIND_DESTDIR="$pkgdir/$(ocamlfind printconf destdir)"
    install -dm755 "$OCAMLFIND_DESTDIR"
    jbuilder install
}
