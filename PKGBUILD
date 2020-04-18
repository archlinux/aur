# Maintainer: robertfoster
pkgname=ocaml-dtools-git
pkgver=r110.3da13a8
pkgrel=1
pkgdesc="OCaml modules for writing daemons"
arch=('i686' 'x86_64')
url="https://github.com/savonet/ocaml-dtools"
license=('GPL2')
depends=('ocaml')
makedepends=('dune')
optdepends=('ocaml-syslog')
#options=('!strip')
source=("$pkgname::git+https://github.com/savonet/ocaml-dtools")

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"
    sed -i 's/2.0/1.11/g' dune-project
}

build() {
    cd "${srcdir}/${pkgname}"

    dune build
}

package() {
    cd "${srcdir}/${pkgname}"

    dune install --prefix "${pkgdir}/usr" \
    --libdir "${pkgdir}$(ocamlfind printconf destdir)"
}
md5sums=('SKIP')
