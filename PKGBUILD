pkgname=feather-wallet-bin
pkgver=2.8.1
pkgrel=2
pkgdesc="A free and open-source Monero desktop wallet."
arch=('x86_64')
url="https://featherwallet.org"
license=('BSD')
depends=()
provides=('feather-wallet')
conflicts=('featherwallet-bin' 'feather-wallet')
source=("feather-${pkgver}-linux.zip::https://github.com/feather-wallet/feather/releases/download/${pkgver}/feather-${pkgver}-linux.zip" "feather-${pkgver}.tar.gz::https://github.com/feather-wallet/feather/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4779c57e9443f7755add3c2414447d1593ebe06998e39a9f765deab5bd64c466'
            'ddc3ec08b7aac8ed2bbd6dce7a5541a04b7b873e5cc25a307c1f215c7a72356c')
noextract=("feather-${pkgver}-linux.zip")

package() {
    install -dm755 "$pkgdir/opt/feather"
    bsdtar -xf "${srcdir}/feather-${pkgver}-linux.zip" -C "$pkgdir/opt/feather"
    mv "$pkgdir/opt/feather/feather-${pkgver}" "$pkgdir/opt/feather/feather"
    chmod +x "$pkgdir/opt/feather/feather"
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/feather/feather "$pkgdir/usr/bin/feather"
    install -Dm644 "${srcdir}/feather-${pkgver}/contrib/flatpak/share/applications/org.featherwallet.Feather.desktop" "$pkgdir/usr/share/applications/feather.desktop"
    sed -i 's|Exec=/app/startup|Exec=feather|; s|Icon=org.featherwallet.Feather|Icon=feather|' "$pkgdir/usr/share/applications/feather.desktop"
    install -Dm644 "${srcdir}/feather-${pkgver}/contrib/flatpak/share/icons/hicolor/256x256/apps/org.featherwallet.Feather.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/feather.png"
    install -Dm644 "${srcdir}/feather-${pkgver}/contrib/flatpak/share/icons/hicolor/128x128/apps/org.featherwallet.Feather.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/feather.png"
}
