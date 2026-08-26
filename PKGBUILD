# Maintainer: Gianlucca Claudino <gianluccaclaudino@gmail.com>

pkgname=lvsk-calendar
pkgver=0.3.11
pkgrel=1
pkgdesc="A beautiful text-based calendar with visual aesthetics for Arch Linux"
arch=('any')
url="https://github.com/Gianluska/lvsk-calendar"
license=('MIT')
depends=('bash' 'coreutils' 'ncurses' 'util-linux')
optdepends=('curl: fetch public holidays from the Nager.Date API'
            'jq: robust JSON parsing for holidays and safe Hyprland window close'
            'hyprland: floating window integration via lvsk-calendar-launcher')
makedepends=('git')
install="${pkgname}.install"

source=("git+https://github.com/Gianluska/lvsk-calendar.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}"

    # Executables
    install -Dm755 lvsk-calendar "${pkgdir}/usr/bin/lvsk-calendar"
    install -Dm755 lvsk-calendar-launcher "${pkgdir}/usr/bin/lvsk-calendar-launcher"

    # Modular source files, installed by glob so a newly added module can
    # never be silently left out of the package again
    local f
    for f in src/*.sh src/ui/*.sh; do
        install -Dm644 "${f}" "${pkgdir}/usr/share/${pkgname}/${f}"
    done

    # Example configuration and builtin backgrounds
    install -Dm644 config.example "${pkgdir}/usr/share/doc/${pkgname}/config.example"
    for f in backgrounds/*.sh; do
        install -Dm644 "${f}" "${pkgdir}/usr/share/doc/${pkgname}/${f}"
    done

    # Documentation and license
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 et:
