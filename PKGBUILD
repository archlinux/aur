# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="bertini2-docs"
pkgname="${_pkgname}-git"
pkgver=r1680.78f9986
pkgrel=1
pkgdesc="HTML documentation for Betini2"
arch=('any')
url="https://github.com/bertiniteam/b2"
license=('custom:GPL-3.0-or-later WITH Bertini2-Additional-GPL-Terms')
makedepends=('git' 'doxygen' 'plantuml' 'graphviz')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="b2"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgsrc}/core/doc"
  doxygen bertini.doxy.config
}

package() {
  cd "${srcdir}/${_pkgsrc}/core/doc/generated_documentation/doc.bertini"
  install -d "${pkgdir}/usr/share/doc/bertini2/html"
  find . -type f -exec install -Dm644 "{}" "${pkgdir}/usr/share/doc/bertini2/html/{}" \;
  rm -f "${pkgdir}/usr/share/doc/bertini2/html/.gitignore"
}
