# Maintainer: Aldis Ruiz <admin@sheep.network>

pkgname=btcpayserver-vault
pkgver=2.0.7
pkgrel=1
pkgdesc="Allows web applications to access your hardware wallet."
arch=('x86_64')
url="https://docs.btcpayserver.org/HardwareWalletIntegration/"
license=('MIT')
depends=(libxcrypt-compat gcc-libs fontconfig zlib)
source=(
    ${pkgname}.desktop
    ${pkgname}.svg
    "https://github.com/btcpayserver/BTCPayServer.Vault/releases/download/Vault%2Fv${pkgver}/BTCPayServerVault-Linux-${pkgver}.tar.gz")
sha256sums=('26879cab72a93ce1d0d677d51a30c71c83d084e21568e65c56322c9fbfaf3c68'
            '161bff315fc56546fa12d620eefed3b036ba30a4cf050c2bb2e35e83c8d976e4'
            '6fb65b41e2111cb175de96b2385cc6fc43d9deb15699f381f87bbf935337bd62')

# allow `*`
shopt -s extglob

package() {
    # copy program files
    install -d ${pkgdir}/opt/${pkgname}
    install -d ${pkgdir}/usr/bin
    cp -r ${srcdir}/!(*.desktop|*.tar.gz) ${pkgdir}/opt/${pkgname}
    # add shortcut
    ln -s /opt/${pkgname}/BTCPayServer.Vault ${pkgdir}/usr/bin/BTCPayServer.Vault
    # icon and desktop files
    install -D -m644 ${srcdir}/btcpayserver-vault.svg ${pkgdir}/usr/share/pixmaps/btcpayserver-vault.svg
    install -D -m644 ${srcdir}/btcpayserver-vault.desktop ${pkgdir}/usr/share/applications/btcpayserver-vault.desktop
}
