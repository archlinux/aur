# Maintainer: Ian MacKay <immackay0@gmail.com>

_pkgname='github-desktop'
pkgname="${_pkgname}-bin"
pkgver=2.0.3
_pkgver="${pkgver}-linux1"
gitname="release-${_pkgver}"
pkgrel=1
pkgdesc="GUI for managing Git and GitHub."
arch=('x86_64')
url="https://desktop.github.com"
license=('MIT')
depends=('gnome-keyring' 'libsecret' 'git' 'curl' 'libxss' 'gconf' 'nss' 'nspr')
optdepends=('hub: CLI interface for GitHub.')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(
    https://github.com/shiftkey/desktop/releases/download/${gitname}/GitHubDesktop-linux-${_pkgver}.deb
    ${_pkgname}.desktop
)
sha256sums=(
    654cca6554389b6c736af45ee63dea62231d6e096a1f7633722e7509a43c14a7
    2758e15659f5770ae2ac948250372135029e7ac2d4b6bf431a112dfdbcc681d1
)
package() {
    tar xf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/opt/GitHub Desktop" "${pkgdir}/opt/${_pkgname}"
    rm "${pkgdir}/usr/share/applications/github-desktop.desktop"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    printf "#!/bin/sh\n\n/opt/${_pkgname}/github-desktop \"\$@\"\n" | install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}"
}
