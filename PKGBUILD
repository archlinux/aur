# Maintainer: hu3rror <hu3rror@protonmail.com>
# Former Maintainer: ventusliberum <dafeinayius@gmail.com>

pkgname=wonderpen-bin
pkgver=2.1.2
_pkgver=6282
pkgrel=1
pkgdesc='A professional writing app with a focused mode and markdown support'
arch=('x86_64')
url='https://www.tominlab.com/en/wonderpen'
license=('custom')
depends=('libappindicator-gtk3' 'libnotify' 'libxss' 'nss' 'xdg-utils')
provides=('wonderpen')
source=("https://file.tominlab.com/WonderPen/${pkgver%.*}/WonderPen_linux_amd64_${pkgver}(${_pkgver}).deb")
sha256sums=('0d33c8f5e47be63825a312830a130e8f040d165e5a3b02fa93c851f11b3f3588')

package() {
    # Install
    cd "$srcdir"
    tar -xJf data.tar.xz -C "$pkgdir"
    install -dm755 "$pkgdir"/usr/bin
    ln -s /opt/WonderPen/wonderpen "$pkgdir"/usr/bin/wonderpen
    sed -i 's|^Exec=/opt/WonderPen/wonderpen %U|Exec=wonderpen %F|g' "$pkgdir"/usr/share/applications/wonderpen.desktop
    mv ${pkgdir}/usr/share/icons/hicolor/0x0 ${pkgdir}/usr/share/icons/hicolor/1024x1024
    install -Dm 644 "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/wonderpen.png" "${pkgdir}/usr/share/pixmaps/wonderpen.png"
}
