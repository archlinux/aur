# Maintainer: Your Name <your.email@example.com>
pkgname=seabird-bin
pkgver=0.6.0
pkgrel=5
pkgdesc="A native Kubernetes desktop IDE for GNOME"
arch=('x86_64')
url="https://github.com/getseabird/seabird"
license=('MPL-2.0')
depends=('gtk4' 'libadwaita')
provides=('seabird')
conflicts=('seabird')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/getseabird/seabird/releases/download/v${pkgver}/seabird_linux_amd64.tar.gz"
        "seabird.desktop::https://raw.githubusercontent.com/getseabird/seabird/main/dev.skynomads.Seabird.desktop"
        "seabird.svg::https://raw.githubusercontent.com/getseabird/seabird/main/internal/icon/seabird.svg"
        "seabird-wrapper.sh")
sha256sums=('552466de9291ba72c915838a0cfbff5f974c2967f6dcc6f00166bc6e24281be7'
            '4d353ba16492894181ba6611e7dfe0a6270abda5117ecdf1c03d2bf4208d8381'
            '833bcc2b80d431f118cdbc1d193efe898b455856d5853b94e8aa9888fcdd4787'
            '71f51c5a1bfaa0ebb84d3f02de792d1b0cb0a9ed3342e4f1c4c442c637cbc4e5')

package() {
    cd "${srcdir}"

    # Install the actual binary to /usr/lib
    install -Dm755 seabird "${pkgdir}/usr/lib/seabird/seabird"

    # Install wrapper script to /usr/bin
    install -Dm755 seabird-wrapper.sh "${pkgdir}/usr/bin/seabird"

    # Patch desktop file to use absolute path
    sed -i 's|^Exec=seabird|Exec=/usr/bin/seabird|' seabird.desktop

    # Install desktop file
    install -Dm644 seabird.desktop "${pkgdir}/usr/share/applications/seabird.desktop"

    # Install icon
    install -Dm644 seabird.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/seabird.svg"

    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
