# Maintainer: czyt <czytcn@gmail.com>
pkgname=herdr-app-desktop-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="Native desktop workspace for terminals and coding agents that keep running (prebuilt)"
arch=('x86_64' 'aarch64')
url="https://herdr.dev"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libglvnd' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'vulkan-icd-loader' 'wayland')
optdepends=('hc-bin: herdr-core background server (the app offers to fetch it on first run)')
provides=("herdr-app=${pkgver}")
# Installs the same files as herdr-app-bin, so the two must not coexist.
conflicts=('herdr-app-bin' 'herdr-app')
options=('!strip' '!debug')

# Upstream publishes no GitHub Releases: versions live in the
# releases.herdr.dev manifest and download URLs are version-pinned.
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://releases.herdr.dev/app/${pkgver}/herdr-app-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://releases.herdr.dev/app/${pkgver}/herdr-app-linux-aarch64.tar.gz")
sha256sums_x86_64=('adef0feab129c84d8de4d95179629bf297e76822d30e0d5e69c262ad232ce33a')
sha256sums_aarch64=('34756580d50a7169ae86ac0345065dd809fc0cdd100763f0124222245072d79b')

package() {
    install -Dm755 "${srcdir}/herdr-app/herdr-app" "${pkgdir}/usr/bin/herdr-app"

    install -Dm644 "${srcdir}/herdr-app/herdr-app.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/herdr-app.svg"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/herdr-app.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Herdr
Comment=Terminals and coding agents that keep running
Exec=herdr-app
Icon=herdr-app
Terminal=false
Categories=Development;
StartupWMClass=herdr-app
DESKTOP

    install -Dm644 "${srcdir}/herdr-app/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/herdr-app/THIRD-PARTY-NOTICES" \
        "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES"
}
