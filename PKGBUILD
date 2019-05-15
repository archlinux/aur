# Maintainer: Bruce Zhang
# Contributor: RemiliaForever <remilia AT koumakan DOT cc>

pkgname=xmind-zen
pkgver=201807162014
pkgrel=2
pkgdesc="XMind - The most popular mind mapping software"
arch=('x86_64')
url="http://www.xmind.net"
license=('EPL' 'LGPL')
depends=('electron2')
provides=('xmind')
conflicts=('xmind')
source=("https://dl3.xmind.net/XMind-ZEN-for-Linux-64bit.rpm")
sha256sums=('0ded9e1bcf15a7cb1aa4c2e364c6b627f1e0cc68c976b850ee9737a35123bc1d')

prepare() {
    sed -i 's/"\/opt\/XMind ZEN\/XMind"/XMind/' "$srcdir/usr/share/applications/XMind.desktop"
    echo "#!/usr/bin/env sh
exec electron2 /usr/share/zmind-zen/app \$@    
" > "$srcdir/XMind.sh"
}

package() {
    # Install resources
    cd "$srcdir/opt/XMind ZEN/resources/app"
    find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/xmind-zen/app/{}" \;

    # Install start script
    install -Dm755 "$srcdir/XMind.sh" "$pkgdir/usr/bin/XMind"

    # Install desktop file
    install -Dm644 "$srcdir/usr/share/applications/XMind.desktop" "$pkgdir/usr/share/applications/XMind.desktop"

    # Install icons
    cd "$srcdir/usr/share/icons/hicolor"
    find . -type f -exec install -Dm644 {} "$pkgdir/usr/share/icons/hicolor/{}" \;
}
