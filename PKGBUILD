# Maintainer: Xaekai <archlinux at pink dot horse>

pkgname=banyanapp
pkgver=3.23.1
pkgrel=1
pkgdesc="Zero trust secure access for modern enterprise"
url="https://www.banyansecurity.io/"
license=('Proprietary')
arch=('x86_64')
depends=(
    'libnotify'
    'libxtst'
    'nss'
    'wireguard-tools'
)
optdepends=('libappindicator-gtk3: System tray support')

source_x86_64=("https://www.banyanops.com/app/releases/banyanapp-${pkgver}.x86_64.rpm")
sha256sums_x86_64=('8e274dff66b636050c0fb66f3a48e78eeacf52d6df247f887347eff970c07def')
install=banyanapp.install

# Prevent stripping of binaries
options=('!strip')

package() {
    # Extract RPM contents
    bsdtar -xf "${srcdir}/banyanapp-${pkgver}.x86_64.rpm" -C "${pkgdir}"
    
    # Fix permissions (ensure binaries are executable)
    chmod +x "${pkgdir}/opt/Banyan/resources/bin/banyanapp-admin"
    chmod +x "${pkgdir}/opt/Banyan/banyanapp"
}
