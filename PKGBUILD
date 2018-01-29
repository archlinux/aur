# Maintainer: nerflad <nerflad@gmail.com>

pkgname=ocaml-easy-format
_oname=easy-format
pkgver=1.3.1
pkgrel=2
pkgdesc="Data pretty printing made easy"
url="https://github.com/mjambon/easy-format"
arch=('i686' 'x86_64' 'armv7h')
options=('!strip' 'staticlibs')
license=('BSD')
makedepends=('ocaml-findlib' 'jbuilder')
source=("https://github.com/mjambon/${_oname}/archive/v${pkgver}.tar.gz")
sha256sums=('489d55ea5de171cea2d7e2114bcd5cebd1fcbf89f839fbf3757769507502e1f0')
build() {
  cd ${srcdir}/${_oname}-${pkgver}
  make all
  sed -i '/doc:\s\[/,$d' _build/default/easy-format.install
}

package() {
  cd ${srcdir}/${_oname}-${pkgver}
  export OCAMLFIND_DESTDIR="${pkgdir}/$(ocamlfind printconf destdir)"
  install -dm755 "$OCAMLFIND_DESTDIR"
  jbuilder install
}
