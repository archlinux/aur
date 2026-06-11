# Maintainer: Kazoku <k4zoku@pm.me>

pkgname=dearsql
pkgver=0.4.10
pkgrel=1
pkgdesc="Cross-platform SQL database client"
arch=('x86_64')
url="https://github.com/dunkbing/dearsql"
license=('FSL')
depends=()
makedepends=()
options=(!strip)
source=(
    "${pkgname}-${pkgver}.AppImage::https://github.com/dunkbing/dearsql/releases/download/v${pkgver}/${pkgname}-${CARCH}.AppImage"
    "${pkgname}.desktop::https://raw.githubusercontent.com/dunkbing/dearsql/refs/tags/v${pkgver}/packaging/io.gitlab.dunkbing.dearsql.desktop"
    "${pkgname}.png::https://raw.githubusercontent.com/dunkbing/dearsql/refs/tags/v${pkgver}/assets/appicon.png"
)
sha256sums=('83a673164da28e80e3d3ded2b8ea7946902a733f41759338e0f33d713b040ea8'
            '8d1eb52592409db0b26abb3def7be743c926ceb4212fddffdfb13d4a5f72420c'
            '03e01e1fe765e93f167d0870e010cd43d4fcb24fe103f7fadf50a6f540828167')

package() {
    # Create app directory
    mkdir -p "${pkgdir}/opt/${pkgname}"
    chmod 777 "${pkgdir}/opt/${pkgname}"

    # Install the AppImage
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
        "${pkgdir}/opt/${pkgname}/${pkgname}"

    # Create a wrapper script in /usr/bin
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'EOF'
#!/bin/sh
exec /opt/dearsql/dearsql "$@"
EOF

    # Install desktop file
    install -Dm644 "${srcdir}/${pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/io.gitlab.dunkbing.dearsql.desktop"

    # Install icon
    install -Dm644 "${srcdir}/${pkgname}.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/io.gitlab.dunkbing.dearsql.png"
}
