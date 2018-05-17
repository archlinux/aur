# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: wenLiangcan <boxeed at gmail dot com>
# Contributor: Taylor Venable <taylor@metasyntax.net>

pkgname=ocaml-lambda-term
pkgver=1.12.0
pkgrel=1
pkgdesc='A cross-platform library for manipulating the terminal'
arch=('i686' 'x86_64')
url='https://github.com/diml/lambda-term'
license=('BSD')
depends=('ocaml' 'ocaml-lwt' 'ocaml-lwt_log' 'ocaml-react' 'ocaml-zed' 'ocaml-camomile')
makedepends=('dune')
source=("https://github.com/diml/lambda-term/archive/${pkgver}.tar.gz"
        "lwt_log.patch")
options=('!strip')
md5sums=('6a6c7c948ed385c6f239b12c283d10de'
         'baeb76a87738fef3a85c3efbfef25b61')

prepare() {
  cd "${srcdir}/lambda-term-${pkgver}"

  patch -Np1 < "${srcdir}/lwt_log.patch"
}

build() {
  cd "${srcdir}/lambda-term-${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/lambda-term-${pkgver}"

  install -dm755 "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/man" "${pkgdir}/usr/share/"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
