# Maintainer: Sebastian Jug <seb AT stianj DOT ug>

pkgname=openbazaar-bin
pkgver=1.1.2
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
sha256sums_i686=('3141b4a9b92e1fe9fb18b4fd90ea1fb737f19c652a626f8994c0015406d3578e')
sha256sums_x86_64=('535e67eadd4e044e7c34c0ce056c244c74d0eb18dd7383c38666c14e6987186d')

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
