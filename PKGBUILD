#shellcheck shell=bash
# Maintainer: Salamandar <felix@piedallu.me>

_pkgname=altium2kicad

pkgname=${_pkgname}-git
pkgver=r241.43b8d7a
pkgrel=1
pkgdesc="Altium to KiCad converter for PCB and schematics"
arch=( 'any' )
url="https://github.com/thesourcerer8/altium2kicad"
license=( 'AGPL3' )
depends=( 'perl' 'perl-math-bezier' 'perl-math-geometry-planar' )
source=( "git+${url}" )
sha256sums=( 'SKIP' )

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    :
}

package () {
    cd "$_pkgname"

    # Install license file
    install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" \
      "LICENSE"

    # Install readmes
    install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname" \
      "README.md" "Tests.md"

    # # Install Freecad macro
    install -Dm644 -t "$pkgdir/usr/share/freecad" \
      "step2wrl.FCMacro"

    # Install executables
    install -d "$pkgdir/usr/bin"
    for exe in "unpack" "convertpcb" "convertschema" ; do
        install -Dm755 -t "$pkgdir/usr/lib/altium2kicad" "${exe}.pl"
        ln -s "/usr/lib/altium2kicad/${exe}.pl" "$pkgdir/usr/bin/altium2kicad_${exe}"
    done
}
