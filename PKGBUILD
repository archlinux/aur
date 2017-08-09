# Maintainer: Brett Dutro <brett.dutro@gmail.com>

pkgname=ocaml-result-git
pkgver=r10.e762be3
pkgrel=2
pkgdesc="Compatibility Result module (git master)"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/janestreet/result"
license=('BSD')
depends=('ocaml')
makedepends=('ocaml-findlib' 'jbuilder-git')
provides=('ocaml-result')
conflicts=('ocaml-result')
options=('!strip')
source=("ocaml-result::git+https://github.com/janestreet/result.git")
sha256sums=('SKIP')

pkgver() {
        cd "${srcdir}/${pkgname%-git}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "${srcdir}/${pkgname%-git}"

  make
}


package() {
  cd "${srcdir}/${pkgname%-git}"

  export OCAMLFIND_DESTDIR="${pkgdir}$(ocamlfind printconf destdir)"
  mkdir -p "${OCAMLFIND_DESTDIR}"
  make INSTALL_ARGS="--prefix ${pkgdir}/usr --libdir ${pkgdir}/usr/lib/ocaml" install

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
