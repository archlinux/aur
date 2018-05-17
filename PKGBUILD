# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=ocaml-lwt_log
pkgver=1.1.0
pkgrel=1
pkgdesc="Lwt-friendly logger"
arch=('x86_64')
url='https://github.com/aantron/lwt_log'
license=('custom:LGPL with OpenSSL linking exception')
depends=('ocaml' 'ocaml-lwt')
makedepends=('dune')
options=('!strip')
source=("https://github.com/aantron/lwt_log/archive/${pkgver}.tar.gz")
md5sums=('92142135d01a4d7e805990cc98653d55')

build() {
  cd "${srcdir}/lwt_log-${pkgver}"

  jbuilder build
}


package() {
  cd "${srcdir}/lwt_log-${pkgver}"

  mkdir -p "${pkgdir}$(ocamlfind printconf destdir)" "${pkgdir}/usr/share"
  jbuilder install --prefix "${pkgdir}/usr" --libdir "${pkgdir}$(ocamlfind printconf destdir)"
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share/"
  install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
