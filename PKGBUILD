pkgname=feather-wallet-bin
pkgver=2.9.1
pkgrel=1
pkgdesc="A free and open-source Monero desktop wallet."
arch=('x86_64')
url="https://featherwallet.org"
license=('BSD')
depends=()
provides=('feather-wallet')
conflicts=('featherwallet-bin' 'feather-wallet')
source=("feather-${pkgver}-linux.zip::https://github.com/feather-wallet/feather/releases/download/${pkgver}/feather-${pkgver}-linux.zip" "feather-${pkgver}.tar.gz::https://github.com/feather-wallet/feather/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f1d40d619664d9e6318c086b9015ee72bc69741ec86148ce2ea2ef75ef47feed'
            'd9af11efeafa7099f5191051a02eadb9fea676f80e5c786f06d5eb291f38e343')
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
