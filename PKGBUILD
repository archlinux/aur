# Maintainer: Sandwich <sandwich@archworks.co>
pkgname=riscal-bin
pkgver=4.3.6
pkgrel=2
pkgdesc="RISC Algorithm Language model checker and exploration tool"
arch=('x86_64')
url="https://www3.risc.jku.at/research/formal/software/RISCAL/"
license=('GPL3')
depends=('java-runtime>=17' 'gtk3')
optdepends=(
  'webkit2gtk: embedded help viewer'
  'java-openjfx: visualization mode (-visual)'
)
source=(
  "RISCAL-${pkgver}.tgz::https://www3.risc.jku.at/research/formal/software/RISCAL/release/RISCAL-${pkgver}.tgz"
  "riscal.sh"
  "riscal.desktop"
  "riscal.png"
)
sha256sums=('53151e8549179749abfed8a70fea577fa9c6fcf4e2ff3ecf9e70618663946814'
            'fec2f1a32b3832ee9da97e608acf043c5ea91d2bdd9a7c1afeb1d03c25e96e08'
            '821c80db1b2418d3c7574ab3b95355c06032c9dd332ccee2075826752081bf66'
            'c2ebf9fd70965990708a640572acea8f5bd81647e1bd6cf88bbac1f59ec41536')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/riscal"

  # Copy upstream contents
  for d in lib spec doc src etc; do
    [[ -e "${d}" ]] && cp -a "${d}" "${pkgdir}/usr/share/riscal/"
  done
  for f in CHANGES README; do
    [[ -f "${f}" ]] && install -m644 "${f}" "${pkgdir}/usr/share/riscal/${f}"
  done

  # Launcher
  install -Dm755 "${srcdir}/riscal.sh" "${pkgdir}/usr/bin/riscal"

  # Desktop file
  install -Dm644 "${srcdir}/riscal.desktop" \
    "${pkgdir}/usr/share/applications/riscal.desktop"

  # Icon
  install -Dm644 "${srcdir}/riscal.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/riscal.png"

  install -Dm644 COPYING \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # Docs
  install -d "${pkgdir}/usr/share/doc"
}

