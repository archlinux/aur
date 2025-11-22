# Maintainer: fka-kafka
pkgname=google-antigravity-bin
pkgver=1.11.5
_buildid=5234145629700096
pkgrel=2
pkgdesc="Google Antigravity Agentic IDE (Binary Release)"
arch=('x86_64')
url="https://antigravity.google"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'xdg-utils' 'libdrm' 'mesa' 'nspr' 'at-spi2-core')
provides=('google-antigravity')
conflicts=('google-antigravity')
options=('!strip')

source=("https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/${pkgver}-${_buildid}/linux-x64/Antigravity.tar.gz"
        "google-antigravity.desktop")

sha256sums=('4e03151a55743cf30fac595abb343c9eb5a3b6a80d2540136d75b4ead8072112'
            'cf6c09424e74e645bc87eb17f987c25b61bb12a01220686f3312080b44861071')

package() {
    # Install the main directory to /opt
    install -d "${pkgdir}/opt/${pkgname}"
    cp -a "${srcdir}/Antigravity/"* "${pkgdir}/opt/${pkgname}/"

    # Set proper permissions for chrome-sandbox
    if [[ -f "${pkgdir}/opt/${pkgname}/chrome-sandbox" ]]; then
        chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"
    fi

    # Create the executable symlink
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/antigravity" "${pkgdir}/usr/bin/google-antigravity"

    # Install the Desktop File
    install -Dm644 "${srcdir}/google-antigravity.desktop" \
        "${pkgdir}/usr/share/applications/google-antigravity.desktop"

    # Install the icon
    install -Dm644 "${srcdir}/Antigravity/resources/app/resources/linux/code.png" \
        "${pkgdir}/usr/share/pixmaps/google-antigravity.png"

    # Install the License
    install -Dm644 "${srcdir}/Antigravity/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}
