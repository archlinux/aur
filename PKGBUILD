# Maintainer: LinusDierheimer <Linus@Dierheimer.de>

pkgname=bash-pipes
pkgver=1.3.0
pkgrel=9
pkgdesc="pipes.sh (animated pipes terminal screensaver) with additional better names (soft links)"
arch=("any")
url="https://github.com/pipeseroni/pipes.sh"
license=("MIT")
depends=("pipes.sh=${pkgver}")
source=()

_alternative_names=(
    "pipes"         # backwards compatibility with old bash-pipes
    "pipes_orig.sh" # backwards compatibility with old bash-pipes
    "bash-pipes"    # personally, i like this name
)

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/man/man6/"
    mkdir -p "${pkgdir}/usr/share/doc/"

    for name in "${_alternative_names[@]}"
    do
        ln -sf "/usr/bin/pipes.sh" "${pkgdir}/usr/bin/${name}"
        ln -sf "/usr/share/man/man6/pipes.sh.6.gz" "${pkgdir}/usr/share/man/man6/${name}.6.gz"
        ln -sf "/usr/share/doc/pipes.sh" "${pkgdir}/usr/share/doc/${name}"
    done

    #Nameclash with xscreensaver
    rm -f "${pkgdir}/usr/share/man/man6/pipes.6.gz"
}
