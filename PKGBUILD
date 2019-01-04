# Maintainer: Ian MacKay <immackay0@gmail.com>

_pkgname='github-desktop'
pkgname="${_pkgname}-bin"
pkgver=1.5.1_linux1
gitname="release-${pkgver//_/-}"
pkgrel=2
pkgdesc="GUI for managing Git and GitHub."
arch=('x86_64')
url="https://desktop.github.com"
license=('MIT')
depends=('gnome-keyring' 'git' 'curl' 'libxss' 'gconf')
optdepends=('hub: CLI interface for GitHub.')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(
    https://github.com/shiftkey/desktop/releases/download/${gitname}/GitHubDesktop-linux-${pkgver//_/-}.deb
    ${_pkgname}.desktop
)
sha256sums=(
    57f13e4d37c8011ab7104465834fa1706f55d4c29a6fe012a8ae215f1dcf452b
    2758e15659f5770ae2ac948250372135029e7ac2d4b6bf431a112dfdbcc681d1
)
package() {
    tar xf data.tar.xz -C "${pkgdir}"
    mv "${pkgdir}/opt/GitHub Desktop" "${pkgdir}/opt/${_pkgname}"
    rm "${pkgdir}/usr/share/applications/github-desktop.desktop"
    install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    printf "#!/bin/sh\n\n/opt/${_pkgname}/github-desktop \"\$@\"\n" | install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}"
}
