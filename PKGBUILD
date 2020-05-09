# Maintainer: LinusDierheimer <Linus@Dierheimer.de>

pkgname=bash-pipes
pkgver=1.3.0
pkgrel=4
pkgdesc="pipes.sh with additional better names (soft links)"
arch=("any")
url="https://github.com/pipeseroni/pipes.sh"
license=("MIT")
depends=("bash")
source=("https://github.com/pipeseroni/pipes.sh/archive/v${pkgver}.tar.gz")
sha256sums=("532976dd8dc2d98330c45a8bcb6d7dc19e0b0e30bba8872dcce352361655a426")
provides=("pipes.sh")
conflicts=("pipes.sh=1.3.0")

_alternative_names=(
    "pipes"
    "bash-pipes"
)

package() {
    cd "${srcdir}/pipes.sh-${pkgver}"

    make DESTDIR="${pkgdir}" PREFIX=/usr install
    install -Dm644 -t "${pkgdir}/usr/share/doc/pipes.sh" LICENSE
    install -Dm644 -t "${pkgdir}/usr/share/doc/pipes.sh" README.rst

    #Cooler names and backwards compatibility with old bash-pipes
    for name in "${_alternative_names[@]}"
    do
        ln -sf "/usr/bin/pipes.sh" "${pkgdir}/usr/bin/${name}"
        ln -sf "/usr/share/man/man6/pipes.sh.6.gz" "${pkgdir}/usr/share/man/man6/${name}.6.gz"
        ln -sf "/usr/share/doc/pipes.sh" "${pkgdir}/usr/share/doc/${name}"
    done
}
