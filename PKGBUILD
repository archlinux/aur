# Maintainer: Jan64X <jan.petrlik@protonmail.com>
pkgname=wifiman-desktop
pkgver=1.1.3
pkgrel=2
pkgdesc="WiFiman Desktop - Network analysis tool by Ubiquiti"
arch=('x86_64')
url="https://www.ui.com/download/app/wifiman-desktop"
license=('custom')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'iw' 'libayatana-appindicator' 'libsoup' 'net-tools' 'openssl' 'pango' 'resolvconf' 'webkit2gtk' 'systemd')
makedepends=('debtap')
source=("https://desktop.wifiman.com/${pkgname}-${pkgver}-amd64.deb")
sha256sums=('cbffe1caaca6b6011daca66dde68a54dbe29a7e4c310341fe917a16200e78730')

prepare() {
    cd "$srcdir"
    ar x "${pkgname}-${pkgver}-amd64.deb"
}

package() {
    cd "$srcdir"
    bsdtar -xf data.tar.* -C "$pkgdir/"
    install -d "$pkgdir/usr/lib/systemd/system"
    ln -s "/usr/lib/wi-fiman-desktop/$pkgname.service" "$pkgdir/usr/lib/systemd/system/"
}
