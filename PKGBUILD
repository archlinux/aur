# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="bertini2-docs"
pkgver=2.0.alpha8
_commit="d21f2b3cbd93cd6dbae9b9306b8d7b0e765a5a91"
pkgrel=1
pkgdesc="HTML documentation for Betini2"
arch=('any')
url="https://github.com/bertiniteam/b2"
license=('custom:GPL-3.0-or-later WITH Bertini2-Additional-GPL-Terms')
makedepends=('doxygen' 'plantuml' 'graphviz')
_pkgsrc="b2-${_commit}"
source=("${_pkgsrc}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('41471b4e0b4aeab92c0a1402bd21da9c69cfdf1c787d92eb80d35bb0b9db62f4')

pkgver() {
  cd "${srcdir}/${_pkgsrc}/core"
  sed -n 's/AC_INIT(\[b2\], \[\([^]]*\)\],.*/\1/p' "configure.ac" | sed 's/-/./'
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
