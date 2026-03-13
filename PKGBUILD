# Maintainer: Victor Ferreira

pkgname=pencil-dev-bin
pkgver=1.1.32
pkgrel=1
pkgdesc="Design on canvas. Land in code. Increases engineering speed by bringing designing directly into your IDE."
arch=('x86_64')
url="https://pencil.dev"
license=('custom')
provides=('pencil-dev')
conflicts=('pencil-dev')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'libcups' 'libdrm' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss' 'pango')
source=("${pkgname}-${pkgver}.tar.gz::https://www.pencil.dev/download/Pencil-linux-x64.tar.gz"
        "pencil-dev.desktop")
sha256sums=('227c4f19a0ff87bd14c160eca3fb815d14a7f523550f4efb0f07832f23785158'
            '73fda772f0429d82e5168ff8de68bfb9ed72ace660758354697f816ba0666a5f')

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
}
