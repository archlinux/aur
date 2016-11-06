# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Your Name <youremail@domain.com>

pkgname=ocp-build
pkgver=1.99.17_beta
pkgrel=1
pkgdesc="A build system for OCaml applications"
arch=('i686' 'x86_64')
url="http://www.typerex.org/${pkgname}.html"
license=('GPL3')
depends=('ocaml')
source=("https://github.com/OCamlPro/typerex-build/archive/${pkgver/_/-}.tar.gz")
md5sums=('524a09f12bd41d17728a1321d4c39bdb')

build() {
  cd "${srcdir}/typerex-build-${pkgver/_/-}"

  ./configure
  make
}

package() {
  cd "${srcdir}/typerex-build-${pkgver/_/-}"

  make install prefix="${pkgdir}/usr"
  # No need for uninstall information - we're using a package manager
  find "${pkgdir}" -name "*.uninstall" -type f -delete
  rm "${pkgdir}/usr/lib/ocaml/installed.ocp"
}
