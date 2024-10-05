# Based on katawa-shoujo-bin PKGBUILD written by Alice Jenkinson <virtual.aur at zero-x dot nz>
# Maintainer: snit <snit@cock.li>

_pkgname=katawa-shoujo-reengineered
pkgname=${_pkgname}-bin
pkgver=1.4.8
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
    cp -r lib/py3-linux-x86_64 lib/python3.9 "${pkgdir}/usr/share/${_pkgname}/lib"

    # start script
    install -D -m755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # icon / desktop file
    install -D -m644 "${srcdir}/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -D -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # license
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

sha512sums=(
    "f6a4f1d47ad86df7dc17abd7542d61cbddbd8ef2aa8fca32e94df5738cab09eecd79da9eb5aaa0563815b2056a09cce3281289b04b8e587133db582e1cac8071"
    "cef74391b6691e8f480fe4527265af96cba5c4b9c87418fe2665bc5e5965e26f225545704b4aba85ddff1609ba96a1f43314dd713abfda8d4fca449993811725"
    "a1e5d6f0662955fe5abd48b5d0e3f3d82faa3c6f6f845fefe5facad93a7ba42f2b682dd52845189432f4328ccef437d786ed942aaaee44d97df86acd47a9bc03"
    "e4c4413fd9418adf91b97b5d23f3f30008fff909a7b0e3190be5d56b2b163d81cfefe78981dbad42562b749de0f5666596b582a0476c649d138f512068e1bbe6"
)
