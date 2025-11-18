# Maintainer: Victor RH <blitzkriegfc@gmail.com>
pkgname=antigravity-preview
pkgver=1.11.2
pkgrel=3
pkgdesc="Google Antigravity - AI-powered development environment (Preview)"
arch=('x86_64')
url="https://antigravity.google"
license=('custom')
depends=(
    'gtk3'
    'nss'
    'alsa-lib'
    'libnotify'
    'libxtst'
    'libxss'
    'libcups'
    'dbus'
    'libsecret'
    'libxkbfile'
    'libxcrypt-compat'
)
optdepends=(
    'libdbusmenu-glib: for global menu support'
    'org.freedesktop.secrets: for storing credentials'
)
provides=('antigravity')
conflicts=('antigravity')
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/${pkgver}-6251250307170304/linux-x64/Antigravity.tar.gz"
        "antigravity.desktop"
        "antigravity-url-handler.desktop"
        "antigravity.png")
sha256sums=('d1b1115ae76c275c376ea660e1e4d2dc20eb3e72d6a206b096505b944a5f64b7'
            '0ce166cb6f0819f1afbdd35f7cc5a8ca97c2faa5fad05f3037c4e82a4da8f8a7'
            'a9cf56cf75208d89817aaf1f71b8deaee03cc21579fe4f0042f396cb6c4e9fb0'
            'd1d32e0d6901c44206ccaa74f8c4b23c5a7293cfd4bbec52de80522afa692f8b')

package() {
    # Install to /usr/share
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cp -r "${srcdir}/Antigravity/"* "${pkgdir}/usr/share/${pkgname}/"

    # Install binary wrapper
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/bin/antigravity" "${pkgdir}/usr/bin/antigravity"

    # Install desktop files
    install -Dm644 "${srcdir}/antigravity.desktop" \
        "${pkgdir}/usr/share/applications/antigravity.desktop"
    install -Dm644 "${srcdir}/antigravity-url-handler.desktop" \
        "${pkgdir}/usr/share/applications/antigravity-url-handler.desktop"

    # Install icon
    install -Dm644 "${srcdir}/antigravity.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/antigravity.png"

    # Install shell completions
    install -Dm644 "${pkgdir}/usr/share/${pkgname}/resources/completions/bash/antigravity" \
        "${pkgdir}/usr/share/bash-completion/completions/antigravity"
    install -Dm644 "${pkgdir}/usr/share/${pkgname}/resources/completions/zsh/_antigravity" \
        "${pkgdir}/usr/share/zsh/site-functions/_antigravity"

    # Install licenses
    install -Dm644 "${pkgdir}/usr/share/${pkgname}/resources/app/LICENSE.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgdir}/usr/share/${pkgname}/resources/app/ThirdPartyNotices.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/ThirdPartyNotices.txt"
}
