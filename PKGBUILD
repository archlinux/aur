# Maintainer: Sebastian Jug <seb AT stianj DOT ug>

pkgname=openbazaar-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="OpenBazaar Client, Decentralized Peer to Peer Marketplace for Bitcoin -- Static binaries"
arch=('i686' 'x86_64')
url="https://github.com/OpenBazaar/OpenBazaar-Client"
license=('MIT')
depends=('gconf' 'glibc' 'libcap' 'gtk2' 'libgcrypt' 'libnotify' 'nss' 'libxtst' 'python' 'xdg-utils' 'desktop-file-utils' 'nodejs')
optdepends=('gvfs' 'lsb-release' 'gnome-keyring' 'libgnome-keyring')
conflicts=('openbazaar' 'openbazaar-git')
install="$pkgname.install"
source_i686=("https://github.com/OpenBazaar/OpenBazaar-Installer/releases/download/v${pkgver}/openbazaar_${pkgver}_i386.deb")
source_x86_64=("https://github.com/OpenBazaar/OpenBazaar-Installer/releases/download/v${pkgver}/openbazaar_${pkgver}_amd64.deb")
sha256sums_i686=('c286c18c940f88e02281afe83a481877cb98218d8197a20059e022b13e4ca053')
sha256sums_x86_64=('7dcd01b3c41a59484264c8ec3fe228f4cb6e6587d8934b3b2b0ffa358e5bfcc8')

package() {
    msg2 "Extracting the data.tar.xz..."
    tar -xf data.tar.xz -C "${pkgdir}/"

    msg2 "Cleaning up..."
    rm -r "$pkgdir"/usr/share/lintian/

    msg2 "Fixing permissions..."
    chmod -R 755 "$pkgdir"/usr/

    msg2 "Installing licenses..."
    install -Dm644 "$pkgdir/usr/share/openbazaar/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$pkgdir/usr/share/openbazaar/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}
