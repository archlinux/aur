# Maintainer: tmtaxman <tmtaxman2 at gmail dot com>

pkgname=omnidb-bin
pkgver=5.5.0
pkgrel=1
pkgdesc="OmniDB Desktop Application"
arch=('x86_64')
_source="https://github.com/heptau/omnidb"
url='https://www.omnidb.net/'
license=('MIT')
provides=('omnidb' 'omnidb-server')
conflicts=('omnidb' 'omnidb-server' 'omnidb-server-bin')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'gdk-pixbuf2' 'libsoup3' 'hicolor-icon-theme')
options=('!strip' '!debug')

source=("$pkgname-$pkgver.tar.gz::$_source/releases/download/v$pkgver/OmniDB-linux-x64.tar.gz"
    "$pkgname-LICENSE::https://raw.githubusercontent.com/heptau/omnidb/refs/heads/master/LICENSE"
    "omnidb.png::https://raw.githubusercontent.com/heptau/omnidb/master/wails-app/build/appicon.png"
)
sha256sums=('d894a9f8b921ce63fd142683cc0d82d49ac614517cbdb0eab0bdf2dc9c6cc5fa'
            'f0d93a9344e68bfd296783b282d1fec6971a063ce44ced52f7dbd426ec68e4b6'
            '3e4202f15cda411ca517f31bcdbdc95530c28fc9f398ae3c0d22112ca1cece69')

package() {
    cd "OmniDB-linux"
    install -Dm755 "OmniDB" "$pkgdir/usr/bin/omnidb"
    install -Dm755 "omnidb-server" "$pkgdir/usr/bin/omnidb-server"
    install -Dm644 "$srcdir/$pkgname-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/omnidb.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/omnidb.png"
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/omnidb.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=OmniDB
Comment=Database management tool with strong support for PostgreSQL
Exec=omnidb
Icon=omnidb
Categories=Development;Database;
Terminal=false
StartupWMClass=OmniDB
EOF
}
