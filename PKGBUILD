# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

declare -Ag _arch=(
  ['aarch64']='aarch64'
  ['powerpc64le']='ppc64le'
  ['riscv64']='riscv64'
  ['x86_64']='x86_64'
)

_pkgname="vsearch"
pkgname="${_pkgname}-bin"
pkgver=2.30.5
pkgrel=2
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
sha256sums_aarch64=('57186958c9a5c5e61d8ae0ff7e990877569274b481c8a68622f69ce80da3462c')
sha256sums_riscv64=('24838a3b81226fc8ced4deb0c746e7d204223aaf74103883ffa089c7f794a2ef')
sha256sums_x86_64=('d6092a03b2e2b1655993c282834924cdd58c05cb4f2eeeeec1ad79ad19057b49')
sha256sums_powerpc64le=('0973f27e77b4114a094013c1868b34da829391780f2e2bb42d971a2989edcf5d')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-linux-${_arch[${CARCH}]}"
  install -vDm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "doc/${_pkgname}_manual.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/MANUAL.pdf"
  install -vDm644 "man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
  install -vDm644 "LICENSE_GNU_GPL3.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE_GNU_GPL3.txt"
}
