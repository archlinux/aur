# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

declare -Ag _arch=(
  ['aarch64']='aarch64'
  ['powerpc64le']='ppc64le'
  ['riscv64']='riscv64'
  ['x86_64']='x86_64'
)

_pkgname="vsearch"
pkgname="${_pkgname}-bin"
pkgver=2.30.6
pkgrel=1
pkgdesc="Versatile open-source tool for microbiome analysis. https://doi.org/10.7717/peerj.2584"
arch=(
  "${!_arch[@]}"
)
url="https://github.com/torognes/${_pkgname}"
license=(
  'BSD-2-Clause OR GPL-3.0-only'
)
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
for _carch in "${!_arch[@]}"; do
  eval "
source_${_carch}=(
  '${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-${_arch[${_carch}]}.tar.gz'
)"
done
sha256sums_aarch64=('df331a9bd10ed1011b6f4f177aee6374c48ce4d73d2b79d9ebad4702c818eb95')
sha256sums_riscv64=('ab9c1d177d9440923acf666498c6e7cf0846589d4566d0d8f8849466dd7a105e')
sha256sums_x86_64=('379e6822cbad19898ae13b8c0245b7f579b7a9a65c9b97f5998c6e1ce77c574d')
sha256sums_powerpc64le=('b97fb51d0bf76b21767efc4fe609741250714b37209e44240650071446ef3687')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-linux-${_arch[${CARCH}]}"
  install -vDm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "doc/${_pkgname}_manual.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/MANUAL.pdf"
  install -vDm644 "man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
  install -vDm644 "LICENSE_GNU_GPL3.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE_GNU_GPL3.txt"
}
