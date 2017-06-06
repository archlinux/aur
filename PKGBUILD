# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-ppx_pipebang
pkgver=113.33.03
pkgrel=1
pkgdesc="A ppx rewriter that inlines reverse application operators \`|>\` and \`|!\`"
arch=('i686' 'x86_64')
url="https://github.com/janestreet/ppx_pipebang"
license=('Apache')
depends=('ocaml' 'ocaml-ppx_core' 'ocaml-ppx_driver' 'ocaml-ppx_tools')
makedepends=('ocaml-findlib' 'ocaml-js-build-tools' 'opam')
options=('!strip' '!emptydirs')
source=("https://ocaml.janestreet.com/ocaml-core/$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+")/files/${pkgname#ocaml-}-$(echo ${pkgver} | grep -Po "^[0-9]+\.[0-9]+\.[0-9]+").tar.gz"
        "libdir.patch"
        "exedir.patch")
md5sums=('c48be58c00c4d55cedce702ecef35584'
         '7f0a951f1ac87385272ea7a6dd58762a'
         '870190f0db69bd4ccd7386fbf761c2cf')

prepare() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  patch -Np1 < "${srcdir}/libdir.patch"
  patch -Np1 < "${srcdir}/exedir.patch"
}

build() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname#ocaml-}-${pkgver}"

  make install PREFIX="${pkgdir}/usr" LIBDIR="${pkgdir}$(ocamlc -where)"
}
