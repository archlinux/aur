# Maintainer: fka-kafka
pkgname=google-antigravity-bin
pkgver=1.11.3
_buildid=6583016683339776
pkgrel=2
pkgdesc="Google Antigravity Agentic IDE (Binary Release)"
arch=('x86_64')
url="https://antigravity.google"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'xdg-utils')
provides=('google-antigravity')
conflicts=('google-antigravity')
options=('!strip')

source=("https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/${pkgver}-${_buildid}/linux-x64/Antigravity.tar.gz"
        "google-antigravity.desktop")

sha256sums=('025da512f9799a7154e2cc75bc0908201382c1acf2e8378f9da235cb84a5615b'
            '293b2a68d78ded9d2e8acf5bebf763ecef7c7e915db37f14a3979f41dc3a373e')

package() {
    # Install the main directory to /opt
    install -d "${pkgdir}/opt/${pkgname}"
    cp -a "${srcdir}/Antigravity/"* "${pkgdir}/opt/${pkgname}/"

    # Create the executable symlink
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/antigravity" "${pkgdir}/usr/bin/google-antigravity"

    # Install the Desktop File
    install -Dm644 "${srcdir}/google-antigravity.desktop" \
        "${pkgdir}/usr/share/applications/google-antigravity.desktop"

    # Install the icon
    install -Dm644 "${srcdir}/Antigravity/resources/app/out/vs/workbench/contrib/antigravityCustomAppIcon/browser/media/antigravity/antigravity.png" \
    "${pkgdir}/usr/share/pixmaps/google-antigravity.png"

    # Install the License
    install -Dm644 "${srcdir}/Antigravity/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
}
