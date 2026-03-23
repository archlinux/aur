# Based on katawa-shoujo-bin PKGBUILD written by Alice Jenkinson <virtual.aur at zero-x dot nz>
# Maintainer: snit <snit@cock.li>

_pkgname=katawa-shoujo-reengineered
pkgname=${_pkgname}-bin
pkgver=2.0.4
pkgrel=1
pkgdesc="A fan-made modernization of the classic visual novel (uses bundled Ren'Py)"
arch=("x86_64")
url="https://www.fhs.sh/projects"
license=('MPL-2.0' 'CC-BY-NC-ND')
conflicts=('katawa-shoujo-reengineered')
options=("!strip")

source=(
    "KSRE-${pkgver}-linux.tar.bz2::https://github.com/fleetingheart/ksre/releases/download/v${pkgver}/KSRE-linux.tar.bz2"
    "${_pkgname}"
    "${_pkgname}.png"
    "${_pkgname}.desktop"
)

package() {
    cd "${srcdir}/KSRE-linux"

    # main files
    install -d -m755 "${pkgdir}/usr/share/${_pkgname}"
    cp -r game renpy "Katawa Shoujo Re-Engineered.py" "${pkgdir}/usr/share/${_pkgname}"

    # libraries
    install -d -m755 "${pkgdir}/usr/share/${_pkgname}/lib"
    cp -r lib/py3-linux-x86_64 lib/python3.12 "${pkgdir}/usr/share/${_pkgname}/lib"

    # start script
    install -D -m755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # icon / desktop file
    install -D -m644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -D -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # license
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
sha256sums=('aa2525c22e9cd9dc0beb306f45e9c318e1c8b68012b6c5a4baf824bf71e66d5b'
            '9479f5dc04a234d8196a2269a6057fc11e9f19479aff55d1c1707cecff24ee9a'
            '1b1443d867cde1b437d8665fd3c68a9eded75064413fa2f76fbc09ca49d26954'
            'd9f15f43f4e2475ca13c3fca9cc8a443fc9f5f5aaa52ff880cc0fb9641d5ccc6')
