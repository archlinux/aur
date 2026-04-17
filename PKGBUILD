# Maintainer: Stirling PDF Inc <contact@stirlingpdf.com>
pkgname=stirling-pdf-desktop
pkgver=2.9.2
pkgrel=1
pkgdesc="Locally hosted, web-based PDF manipulation tool (Tauri desktop app, official Stirling PDF Inc build)"
arch=('x86_64')
url="https://www.stirling.com"
license=('MIT' 'LicenseRef-Stirling-PDF-Proprietary')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3')
provides=('stirling-pdf')
conflicts=('stirling-pdf' 'stirling-pdf-git' 'stirling-pdf-bin')
options=('!strip')

source_x86_64=("${pkgname}-${pkgver}.deb::https://github.com/Stirling-Tools/Stirling-PDF/releases/download/v${pkgver}/Stirling-PDF-linux-x86_64.deb")
sha256sums_x86_64=('55618199e2a1bb7ddb212225245205b10a189afb4c1e26e97d0752a33dcf0151')

package() {
    # Extract the .deb archive
    bsdtar -xf data.tar* -C "${pkgdir}"

    # Fix permissions
    find "${pkgdir}" -type d -exec chmod 755 {} \;

    # Install license
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<EOF
Copyright (c) 2025 Stirling PDF Inc
All rights reserved. See https://github.com/Stirling-Tools/Stirling-PDF/blob/main/LICENSE
EOF
}
