# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=(zoho-cliq zoho-cliq-upstream-electron)
pkgver=1.5.5
pkgrel=2
pkgdesc='Zoho Cliq communication software'
arch=('x86_64')
url="https://www.zoho.com/cliq/desktop/linux.html"
license=('Proprietary')
depends=('alsa-lib' 'gtk3' 'libsecret' 'libxss' 'libxtst' 'nss' 'xdg-utils')
optdepends=('libappindicator-gtk3: Systray indicator support'
            'org.freedesktop.secrets: Keyring password store support')
source=(
    "https://downloads.zohocdn.com/chat-desktop/linux/cliq_${pkgver}_amd64.deb"
)

package_zoho-cliq() {
    conflicts=('zoho-cliq-upstream-electron')
    install -d "${pkgdir}/opt"
    install -d "${pkgdir}/usr/share"
    cd "${srcdir}"
    tar xf data.tar.xz
    cp -r opt/Cliq "${pkgdir}/opt/Cliq"
    cp -r usr/share/* "${pkgdir}/usr/share/"
}

package_zoho-cliq-upstream-electron() {
    electron_ver='electron16'
    depends+=($electron_ver)
    conflicts=('zoho-cliq')
    pkgdesc='Zoho Cliq running on upstream Electron (experimental)'
    install_files=(
        '/opt/Cliq/resources/app.asar'
        '/usr/share/applications/cliq.desktop'
        '/usr/share/doc/cliq/changelog.gz'
        '/usr/share/icons/hicolor/16x16/apps/cliq.png'
        '/usr/share/icons/hicolor/32x32/apps/cliq.png'
        '/usr/share/icons/hicolor/48x48/apps/cliq.png'
        '/usr/share/icons/hicolor/64x64/apps/cliq.png'
        '/usr/share/icons/hicolor/128x128/apps/cliq.png'
        '/usr/share/icons/hicolor/256x256/apps/cliq.png'
        '/usr/share/icons/hicolor/512x512/apps/cliq.png'
        '/usr/share/icons/hicolor/1024x1024/apps/cliq.png'
    )

    tar xf data.tar.xz

    for file in "${install_files[@]}"; do 
        install -Dm 644 "${srcdir}${file}" "${pkgdir}${file}"
    done

    echo -e "#!/bin/bash\n\nexec /usr/bin/$electron_ver /opt/Cliq/resources/app.asar" > "${pkgdir}/opt/Cliq/cliq"
    chmod +x "${pkgdir}/opt/Cliq/cliq"
}

sha256sums=('f58468c002398ec12aaeac454ac785644889719c35b0ef64c646ebcb8a968982')
