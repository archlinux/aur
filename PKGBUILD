# Maintainer: Ian MacKay <immackay0@gmail.com>

_pkgname='github-desktop'
pkgname="${_pkgname}-bin"
pkgver=1.3.4
gitname="release-${pkgver//_/-}"
pkgrel=2
pkgdesc="GUI for managing Git and GitHub."
arch=('x86_64')
url="https://desktop.github.com"
license=('MIT')
depends=('gnome-keyring' 'git' 'libcurl-openssl-1.0')
optdepends=('hub: CLI interface for GitHub.')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(
    https://github.com/shiftkey/desktop/releases/download/${gitname}/GitHubDesktop-linux-amd64-${pkgver}.deb
    ${_pkgname}.desktop
)
sha256sums=(
    47c1929b3d2c4c73aa5e8db9881a4d7ff03d4fbdf3f511481633275cbe0ad51c
    8545ffdcd8685a2d642a733f9dc407b9b269e2c8fd54f30e1eb336c2aff89318
)
package() {
    tar xf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/opt/GitHubDesktop" "${pkgdir}/opt/${_pkgname}"
    rm "${pkgdir}/usr/share/applications/desktop.desktop"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    printf "#!/bin/sh\n\nLD_PRELOAD=libcurl.so.4 /opt/${_pkgname}/desktop \"$@\"\n" | install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}"
}
