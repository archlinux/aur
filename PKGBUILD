# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>
# Maintainer: Mahor Foruzesh <mahorforuzesh at pm dot me>

pkgname=tachidesk
pkgver=0.6.0_r1048
pkgrel=2
pkgdesc="A free and open source manga reader that runs extensions built for Tachiyomi"
arch=("any")
url="https://github.com/Suwayomi/Tachidesk-Server"
license=("MPL2")
depends=("java-runtime>=8")
optdepends=("electron: running in Electron")
provides=("tachidesk" "tachidesk-server")
conflicts=("tachidesk-preview")
_semver="v${pkgver%_*}"
_commit="${pkgver#*_}"
_jar=Tachidesk-Server-${_semver}-${_commit}.jar

source=("${url}/releases/download/${_semver}/${_jar}"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}-browser.sh"
        "${pkgname}-debug.sh"
        "${pkgname}-electron.sh")
sha256sums=('9ecf6a9851f474480a2bc991079024e53ce5a86bb65339312012afd5b84d8e4c'
            '22a6a9a8c8198985759f66b35377d87bce82d46dbf7a4a7505b55621a9c5487e'
            '7528715b5b8d8360a9fd7dc096b51fd52bf3da671167e224b6cb637437fc4831'
            'ab6896577aabad86dc1ed38612d926820e1c8c51074d46afda0c280e90b4f1a9'
            'fdf5ed21e7b05a59521005ea618a40c46750a46a6cb1aa7cbd8c09bc9e595b94'
            '56f12c13218ad58e1c9d26338d5d19b6ced92d789b043837be5d2420657ca417')

noextract=("${_jar}")

package() {
    install -Dm644 "${srcdir}/${_jar}"                "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
    install -Dm644 "${srcdir}/${pkgname}.desktop"  -t "${pkgdir}/usr/share/applications/"
    install -Dm644 "${srcdir}/${pkgname}.png"      -t "${pkgdir}/usr/share/pixmaps/"
    install -Dm755 "${srcdir}/${pkgname}-browser.sh"  "${pkgdir}/usr/bin/${pkgname}-browser"
    install -Dm755 "${srcdir}/${pkgname}-debug.sh"    "${pkgdir}/usr/bin/${pkgname}-debug"
    install -Dm755 "${srcdir}/${pkgname}-electron.sh" "${pkgdir}/usr/bin/${pkgname}-electron"
    ln -s "/usr/bin/${pkgname}-browser" "${pkgdir}/usr/bin/${pkgname}" # keep backwards compatibility
}
