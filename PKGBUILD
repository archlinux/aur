# Maintainer: yuhr <sdn.pate(at)gmail.com>

pkgname=macrodown-git
pkgver=0.0.0
pkgrel=5
pkgdesc="The translator for Macrodown, a markup language wrapping other markup languages such as TeX/LaTeX or HTML."
url="https://github.com/gfngfn/Macrodown"
license=('MIT')
arch=('i686' 'x86_64')
conflicts=('macrodown')
provides=('macrodown')
makedepends=('git' 'make' 'ocaml' 'ocamlbuild' 'ocaml-findlib' 'ocaml-menhir')
source=('git+https://github.com/gfngfn/Macrodown.git')
md5sums=(SKIP)

pkgver() {
  cd ${srcdir}/Macrodown
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

build() {
  cd ${srcdir}/Macrodown
  make
}

package() {
  cd ${srcdir}/Macrodown
  install -dm755 "${pkgdir}"/usr/bin
  install -m755 ./macrodown "${pkgdir}"/usr/bin/

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
