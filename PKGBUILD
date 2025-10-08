# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="linux-syscall-support"
pkgver=2024.02.01
pkgrel=2
pkgdesc="Linux Syscall Support"
arch=('any')
url="https://chromium.googlesource.com/${pkgname}"
license=('BSD-3-Clause')
makedepends=(
  'git'
)
_pkgsrc="${url##*/}"
source=("${_pkgsrc}::git+${url}.git#tag=v${pkgver}")
b2sums=('455f9aefdeedfe86f826065c671bc83fa3c38f5ed0e03816fb59597d5f8e477aa8056b7aa6b16da3c9c76019240f02c5464d0e66f13044a771d18d3b264c8e5c')

check() {
  cd "${srcdir}/${_pkgsrc}/tests"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "${pkgname//-/_}.h" "${pkgdir}/usr/include/${pkgname//-/_}.h"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
