# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Your Name <youremail@domain.com>

pkgname=ocp-build
pkgver=1.99.19_beta
pkgrel=1
pkgdesc="A build system for OCaml applications"
arch=('i686' 'x86_64')
url="http://www.typerex.org/ocp-build.html"
license=('GPL3')
depends=('ocaml' 'ocaml-findlib')
source=("https://github.com/OCamlPro/ocp-build/archive/${pkgver/_/-}.tar.gz"
        "link-terminfo.patch")
md5sums=('e4d5e3bc256091b5907a43613c33411c'
         '5e13a6bc6dd42eba07214284fc8d7051')

prepare() {
  cd "${srcdir}/ocp-build-${pkgver/_/-}"

  patch -Np1 < "${srcdir}/link-terminfo.patch"
}

build() {
  cd "${srcdir}/ocp-build-${pkgver/_/-}"

  ./configure "--with-metadir=${pkgdir}$(ocamlfind printconf destdir)"
  make
}

package() {
  cd "${srcdir}/ocp-build-${pkgver/_/-}"

  make install prefix="${pkgdir}/usr"
  # No need for uninstall information - we're using a package manager
  find "${pkgdir}" -name "*.uninstall" -type f -delete
  rm "${pkgdir}/usr/lib/ocaml/installed.ocp"
}
