# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="libpp"
pkgver=2.4.1
pkgrel=1
pkgdesc="Functional-programming macros for the C preprocessor."
arch=('any')
url="https://github.com/mcinglis/${pkgname}"
license=('MIT')
makedepends=('python')
checkdepends=('bash')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('7a3e9d1431c226c956b38eee01ad3a8462b20778c3168eeed7869fb6abaa3796545834da99a2f42ce88d0d85c8e1388dc090828984cf4a0864ea8253429ecadb')

build() {
  cd "${srcdir}/${_pkgsrc}"
  # make LIBPP_LIMIT=x templates
  make templates
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  make test
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  find . -maxdepth 1 -type f -name "*.h" -exec \
    install -vDm644 "{}" "${pkgdir}/usr/include/${pkgname}/{}" \;

  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
