# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=result
pkgname=ocaml-${_pkgname}
pkgver=1.3
pkgrel=1
pkgdesc="Compatibility Result module"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/janestreet/result"
license=('BSD')
depends=('ocaml')
makedepends=('ocaml-findlib' 'dune')
options=('!strip')
source=("https://github.com/janestreet/result/archive/${pkgver}.tar.gz")
sha256sums=('47a4a7abca084ac844716b047d4b26eacbd96174034c8836f35cd400e84c8db4')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  export OPAMROOT="${srcdir}/.opam"
  opam init -n
  jbuilder build
}


package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind printconf destdir)"
  jbuilder install --prefix "${pkgdir}/usr" \
    --libdir "${pkgdir}$(ocamlfind printconf destdir)"

  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
}
