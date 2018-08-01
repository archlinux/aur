# Maintainer: Ian MacKay <immackay0@gmail.com>

_pkgname='github-desktop'
pkgname="${_pkgname}-bin"
pkgver=1.3.1
gitname="release-${pkgver//_/-}"
pkgrel=1
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
    52cb9a955b5981bf17fa8f3d529540bd75f1e38c0379c24aec4f84f8758125f1
)
package() {
    tar xf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/opt/GitHubDesktop" "${pkgdir}/opt/${_pkgname}"
    rm "${pkgdir}/usr/share/applications/desktop.desktop"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    printf '#!/bin/sh\n\nLD_PRELOAD=libcurl.so.3 /opt/github-desktop/desktop "$@"\n' | install -Dm755 /dev/stdin "${pkgdir}/usr/bin/github-desktop"
}
