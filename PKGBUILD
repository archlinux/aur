# Based on katawa-shoujo-bin PKGBUILD written by Alice Jenkinson <virtual.aur at zero-x dot nz>
# Maintainer: snit <snit@cock.li>

_pkgname=katawa-shoujo-reengineered
pkgname=${_pkgname}-bin
pkgver=2.0.3
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

sha512sums=(
    'd448c1c850b9e2db0b44b8303dd644e8d5fe4108a8582b314aabb1fa2b7c385609a9244767b576f058c3f8064ad4f8f964a5f894e3f3c8daafbc2e0f905f9047'
    'cef74391b6691e8f480fe4527265af96cba5c4b9c87418fe2665bc5e5965e26f225545704b4aba85ddff1609ba96a1f43314dd713abfda8d4fca449993811725'
    'a1e5d6f0662955fe5abd48b5d0e3f3d82faa3c6f6f845fefe5facad93a7ba42f2b682dd52845189432f4328ccef437d786ed942aaaee44d97df86acd47a9bc03'
    'e4c4413fd9418adf91b97b5d23f3f30008fff909a7b0e3190be5d56b2b163d81cfefe78981dbad42562b749de0f5666596b582a0476c649d138f512068e1bbe6'
)
