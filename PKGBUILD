# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=mwc-qt-wallet-bin
pkgver=1.0.10
pkgrel=1
pkgdesc="QT wallet client for a fork of the Grin project with a 20 million supply cap and airdrop to Bitcoin holders"
arch=('x86_64')
url="https://www.mwc.mw/"
license=('Apache')
depends=('hicolor-icon-theme' 'qt5-base')
source_x86_64=("https://github.com/mwcproject/mwc-qt-wallet/releases/download/${pkgver}/mwc-qt-wallet_${pkgver}-linux64.deb")
sha512sums_x86_64=('807d6317a64f9c45bffe47aee046a472a014ed7664772fda3363d8996981553a144257f87aaac5c7c104851af9576ca3d5f4621822d54eae6361973891dbf8a6')

prepare() {
    tar -Jxvf data.tar.xz
}

build() {
    # Fix desktop file for new location of wallet binary
    sed -i 's/^Exec=.*/Exec=mwc-qt-wallet/' "$srcdir"/usr/share/applications/mwc-qt-wallet.desktop
    sed -i 's/^Path=.*//' "$srcdir"/usr/share/applications/mwc-qt-wallet.desktop
}

package() {
    install -d "$pkgdir"/usr/bin

    # Install all /usr/share
    cp -r "$srcdir/usr/share" "$pkgdir/usr"
    # Install binaries
    cp "$srcdir/usr/local/mwc-qt-wallet/bin"/* "$pkgdir/usr/bin"
}
