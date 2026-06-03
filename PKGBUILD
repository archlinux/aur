# Maintainer: thefangeddeity
pkgname=ele-messenger-client
pkgver=1.3.3
pkgrel=1
pkgdesc="ELE Messenger desktop client — resilience-first household chat"
arch=('x86_64')
url="https://github.com/thefangeddeity/ele-messenger"
license=('GPL3')
depends=('gtk3' 'libsecret' 'mpv')
source=("ele-messenger-client-$pkgver-linux-x64.tar.gz::https://github.com/thefangeddeity/ele-messenger/releases/download/v$pkgver/ele-messenger-client-$pkgver-linux-x64.tar.gz")
sha256sums=('24772ed45b483e7730197906caf2d56daf319f74a5672c51c742548093b030af')

package() {
    install -dm755 "$pkgdir/usr/lib/ele-messenger-client"
    cp -r "$srcdir/bundle/." "$pkgdir/usr/lib/ele-messenger-client/"
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/ele-messenger-client" << 'WRAPPER'
#!/bin/sh
cd "$HOME"
exec /usr/lib/ele-messenger-client/ele_messenger "$@"
WRAPPER
    install -Dm644 "$srcdir/bundle/data/flutter_assets/assets/icon.png" \
        "$pkgdir/usr/share/pixmaps/ele-messenger-client.png"
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/ele-messenger-client.desktop" << 'DESKTOP'
[Desktop Entry]
Name=ELE Messenger
Exec=ele-messenger-client
Icon=ele-messenger-client
Type=Application
Categories=Network;InstantMessaging;
DESKTOP
}
