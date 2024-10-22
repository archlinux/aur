# Maintainer: Sayedul Sayem <sayedulsayem@gmail.com>

pkgname=whatsapp-linux-desktop
pkgver=1.0.1
pkgrel=1
pkgdesc="An unofficial WhatsApp Linux Desktop application"
arch=('x86_64')
url="https://github.com/sayedulsayem/$pkgname"
license=('MIT')
conflicts=('whatsapp-linux-desktop-bin')
depends=('electron' 'libxss' 'nss' 'libxtst' 'libnotify' 'libappindicator-gtk3')
source=("$pkgname-${pkgver}.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver-x64.tar.gz")
sha256sums=('2bf6a499162a91af524597e977c366c9c28432a6f2712f0ced7acf45fae51581')

package() {
	mkdir -p "${pkgdir}/opt/$pkgname"
	tar -xvzf "${srcdir}/$pkgname-${pkgver}.tar.gz" --strip-components=1 -C "${pkgdir}/opt/$pkgname"
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/$pkgname/$pkgname" "${pkgdir}/usr/bin/$pkgname"

    mkdir -p "${pkgdir}/usr/share/applications/"
    
    cat << EOF > "${pkgdir}/usr/share/applications/$pkgname.desktop"
    [Desktop Entry]
    Name=WhatsApp Desktop
    Exec=/opt/$pkgname/$pkgname
    Icon=/opt/$pkgname/resources/build/icon.png
    Type=Application
    Categories=Chat;Messaging;
    StartupWMClass=WhatsApp Desktop
EOF

    chmod +x "${pkgdir}/usr/share/applications/$pkgname.desktop"
}