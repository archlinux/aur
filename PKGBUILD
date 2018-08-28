# Maintainer: robertfoster

pkgname=ocaml-base-git
pkgver=0.2.alpha1.r77.g36db7f8
pkgrel=1
pkgdesc="Full standard library replacement for OCaml"
arch=('x86_64')
url='https://github.com/janestreet/base'
license=('Apache')
depends=('ocaml' 'ocaml-sexplib0')
makedepends=('dune')
options=('!strip')
provides=("${pkgname%%-git}")
replaces=("${pkgname%%-git}")
source=("base::git+https://github.com/janestreet/base.git")

pkgver() {
    cd "$srcdir/base"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/base"
    jbuilder build
}

package() {
    cd "$srcdir/base"
    mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
    jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
    mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}

md5sums=('SKIP')
