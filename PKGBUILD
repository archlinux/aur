pkgname=anihot-app
pkgver=6.0.8
pkgrel=1
arch=('x86_64')
url="https://github.com/MrGlany/AniHotAppPC"
license=('custom')
depends=('glibc')

source=("anihot-$pkgver.zip::https://github.com/MrGlany/AniHotAppPC/releases/download/${pkgver}r/${pkgver}-linux.zip")
sha256sums=('SKIP')

package() {
    cd "$srcdir"

    # Main directory
    install -d "$pkgdir/usr/lib/$pkgname"

    # Copy runtime files
    cp -r lib data share "$pkgdir/usr/lib/$pkgname/"

    # Main executable
    install -Dm755 "AniHot App" "$pkgdir/usr/lib/$pkgname/anihot-app"

    # Wrapper (Flutter requires correct working directory)
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/anihot" <<'EOF'
#!/bin/bash
cd /usr/lib/anihot-app
exec ./anihot-app "$@"
EOF

    # Desktop entry
    install -Dm644 share/applications/com.anihot.anihot.desktop \
        "$pkgdir/usr/share/applications/anihot.desktop"

    # Icon
    install -Dm644 share/icons/hicolor/256x256/apps/com.anihot.anihot.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.anihot.anihot.png"
}
