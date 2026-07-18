# Maintainer: deadgirl <deadgirl2133@gmail.com>

pkgname=cock-mail-app
pkgver=0.5.1
pkgrel=1
pkgdesc='App-menu launcher and local Docker wrapper for Cock-mail webmail'
arch=('any')
url='https://github.com/numbpill3d/cock-mail-app'
license=('0BSD' 'LicenseRef-cock-mail')
depends=('docker' 'docker-compose' 'xdg-utils' 'bash' 'coreutils' 'curl' 'gnupg'
         'hicolor-icon-theme')
install='cock-mail-app.install'
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}-${pkgrel}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('2d01fb950eff451bcf5ec85b9511b470dade0c72d17b77153b69a0f1caf714b7')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -d "${pkgdir}/opt/cock-mail-app"
    cp -a vendor/cock-mail "${pkgdir}/opt/cock-mail-app/cock-mail"

    install -D -m755 scripts/cock-mail-app-launch \
        "${pkgdir}/usr/bin/cock-mail-app-launch"
    install -D -m644 packaging/cock-mail-app.desktop \
        "${pkgdir}/usr/share/applications/cock-mail-app.desktop"
    install -D -m644 assets/cock-mail-app.png \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/cock-mail-app.png"

    install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -D -m644 vendor/cock-mail/README.txt \
        "${pkgdir}/usr/share/doc/${pkgname}/README.upstream.txt"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 LICENSE.upstream \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.upstream"
}
