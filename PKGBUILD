# Maintainer: Victor Ferreira

pkgname=pencil-dev-bin
pkgver=1.1.34
pkgrel=1
pkgdesc="Design on canvas. Land in code. Increases engineering speed by bringing designing directly into your IDE."
arch=('x86_64')
url="https://pencil.dev"
license=('custom')
provides=('pencil-dev')
conflicts=('pencil-dev')
options=('!strip' '!debug')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'libcups' 'libdrm' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango')
source=("${pkgname}-${pkgver}.tar.gz::https://www.pencil.dev/download/Pencil-linux-x64.tar.gz"
        "pencil-dev.desktop"
        "pencil.png")
sha256sums=('1d2aead2badf506216630d1a2cb3621c9c56ed2282c2bd03112d9bd9c94b8689'
            '73fda772f0429d82e5168ff8de68bfb9ed72ace660758354697f816ba0666a5f'
            '131ee5d9793ddaca67577727532493fb451a02e0903fc804b93d2142de16b331')

package() {
    cd "${srcdir}/Pencil-${pkgver}-linux-x64"

    install -d "${pkgdir}/opt/${pkgname}"
    cp -r * "${pkgdir}/opt/${pkgname}/"

    # Set permissions for chrome-sandbox
    chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"

    # Create binary symlink
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/pencil" "${pkgdir}/usr/bin/pencil-dev"

    # Install desktop entry
    install -Dm644 "${srcdir}/pencil-dev.desktop" "${pkgdir}/usr/share/applications/pencil-dev.desktop"

    # Install application icon
    install -Dm644 "${srcdir}/pencil.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/pencil.png"
}
