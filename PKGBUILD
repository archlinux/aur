# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

declare -Ag _arch=(
  ['aarch64']='aarch64'
  ['powerpc64le']='ppc64le'
  ['riscv64']='riscv64'
  ['x86_64']='x86_64'
)

_pkgname="vsearch"
pkgname="${_pkgname}-bin"
pkgver=2.31.0
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
  # 'libgcc'
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
sha256sums_aarch64=('b053c0da34b48b5f05ce16268e46bc6dfe3458ab6c0ba688db786045c7e94f43')
sha256sums_riscv64=('de923dcadd7709e908e0f22eac5f7b4805367b0d82d44fdf32a887efa7d9f5f4')
sha256sums_x86_64=('1f07aec19cdeaf2a0ce8d9e3c9e6bb76a5cbf54e86d40bc50cb314a06ace2a16')
sha256sums_powerpc64le=('001db966b4b016abb6c391c1c4a51a7e0395b7ae417fb206039da23f35af72f6')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-linux-${_arch[${CARCH}]}"
  install -vDm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "doc/${_pkgname}_manual.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/MANUAL.pdf"
  install -vDm644 "man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
  install -vDm644 "LICENSE_GNU_GPL3.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE_GNU_GPL3.txt"
}
