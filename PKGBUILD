# Maintainer: Ian MacKay <immackay0@gmail.com>

_pkgname='github-desktop'
pkgname="${_pkgname}-bin"
pkgver=1.3.1
gitname="release-${pkgver//_/-}"
pkgrel=2
pkgdesc="GUI for managing Git and GitHub."
arch=('x86_64')
url="https://desktop.github.com"
license=('MIT')
depends=('gnome-keyring' 'git' 'electron' 'nodejs' 'libcurl-compat' 'libcurl-gnutls')
optdepends=('hub: CLI interface for GitHub.')
source=(
    https://github.com/shiftkey/desktop/releases/download/release-1.3.1/GitHubDesktop-linux-amd64-1.3.1.deb
    ${_pkgname}.desktop
)
sha256sums=(
    52837bbd87e42ff12bdc45bf9f05df5ac329e2f765554b776d8a8ca7b3d2a823
    8545ffdcd8685a2d642a733f9dc407b9b269e2c8fd54f30e1eb336c2aff89318
)
package() {
    tar xf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/opt/GitHubDesktop" "${pkgdir}/opt/${_pkgname}"
    rm "${pkgdir}/usr/share/applications/desktop.desktop"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    printf '#!/bin/sh\n\nLD_PRELOAD=libcurl.so.3 /opt/github-desktop/desktop "$@"\n' | install -Dm755 /dev/stdin "${pkgdir}/usr/bin/github-desktop"
}
