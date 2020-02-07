# Maintainer: Salamandar <felix@piedallu.me>

_pkgname=altium2kicad

pkgname=${_pkgname}-git
pkgver=r219.f7e739f
pkgrel=1
pkgdesc="Altium to KiCad converter for PCB and schematics"
arch=('i686' 'x86_64' 'armv6' 'armv6h' 'armv7h')
url="https://github.com/thesourcerer8/altium2kicad"
license=('AGPL3')
depends=(
  'perl'
)
source=(
  "git+${url}"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  :
}

package () {
  cd "${_pkgname}"

  install -d "$pkgdir/usr/share/altium2kicad"
  cp -R \
    "Math" \
    "Altium2KiCad.png" \
    "README.md" \
    "step2wrl.FCMacro" \
    "Tests.md" \
    "LICENSE" \
    "convertpcb.pl" "convertschema.pl" "unpack.pl" \
    "${pkgdir}/usr/share/altium2kicad"


  install -d "$pkgdir/usr/bin/"
  ln -s "/usr/share/altium2kicad/unpack.pl" "${pkgdir}/usr/bin/altium2kicad_unpack"
  chmod +x "${pkgdir}/usr/bin/altium2kicad_unpack"
}
