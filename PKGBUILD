# Maintainer: Cranky Supertoon <crankysupertoon@gmail.com>
pkgname="replit-desktop-bin"
_pkgname="repl.it"
pkgver="2.1.0"
pkgrel=1
arch=('x86_64')
pkgdesc="Un-official electron desktop app for https://repl.it"
url="https://github.com/repl-it-discord/repl-it-electron"
license=('Apache 2.0')
makedepends=('gendesk')
conflicts=('replit-desktop')
source_x86_64=(
    "repl.it_${pkgver}_amd64.deb::https://github.com/repl-it-discord/repl-it-electron/releases/download/${pkgver}/repl.it_${pkgver}_amd64.deb"
)

md5sums_x86_64=('SKIP')

package() {
    # Extract deb file
    tar xf data.tar.xz -C "${pkgdir}"

    # install the main files.
    install -d -m755 "${pkgdir}/opt/${_pkgname}"

    # install the icon
    install -d -m755 "${pkgdir}/usr/share/icons"

    # fix file permissions - all files as 644 - directories as 755
    find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
    find "${pkgdir}/"{opt,usr} -type f -exec chmod 644 {} \;

    # make sure the main binary has the right permissions
    chmod +x "${pkgdir}/opt/${_pkgname}/${_pkgname}"

    # link the binary
    install -d -m755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
