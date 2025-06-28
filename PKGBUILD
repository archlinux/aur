# Maintainer: CUB3D <cub3d at cub3d dot pw>

pkgname=ghidra-git-bin
pkgver=11.4
_builddate='20250620'
pkgrel=7
pkgdesc='Software reverse engineering framework'
url='https://ghidra-sre.org/'
arch=('x86_64' 'aarch64')
license=('Apache-2.0')
depends=('java-environment>=21' 'libxtst' 'libxrender')
makedepends=('unzip' 'java-environment=21')
provides=('ghidra')
conflicts=(
  'ghidra'
  'ghidra-dev'
)
source=(
     https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_${pkgver}_build/ghidra_${pkgver}_PUBLIC_${_builddate}.zip
)
sha256sums=('8b2902bb3166901bc6297a06892eee077c08605be65abfe73ce7aaaafb651632')                      
OPTIONS=(!strip)

package() {
  # Extract built archive into destination folder
  mkdir -p "${pkgdir}/opt/ghidra/"
  mv ghidra_${pkgver}_PUBLIC "${pkgdir}/opt"
  mv "${pkgdir}/opt/ghidra_${pkgver}_PUBLIC/"* "${pkgdir}/opt/ghidra/"
  rm -r "${pkgdir}/opt/ghidra_${pkgver}_PUBLIC" 

  mkdir -p "${pkgdir}/usr/bin/"
  ln -s /opt/ghidra/ghidraRun "${pkgdir}"/usr/bin/ghidra
  ln -s /opt/ghidra/support/analyzeHeadless "${pkgdir}"/usr/bin/ghidra-analyzeHeadless
}

# vim: ts=2 sw=2 et:
