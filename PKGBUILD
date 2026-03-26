# Maintainer: codismodiss <leebutworse@gmail.com>
pkgname=codimux
pkgver=0.2.0
pkgrel=1
pkgdesc="ffmpeg GUI for encoding video to different platforms"
arch=('any')
url="https://github.com/codismodiss/CoDiMux"
license=('MIT')
depends=('ffmpeg' 'python' 'python-gobject' 'libadwaita')
source=("$pkgname-$pkgver.tar.gz::https://github.com/codismodiss/CoDiMux/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "CoDiMux-${pkgver}"

    install -dm755 "$pkgdir/usr/share/codimux"
    cp -r codimux/ "$pkgdir/usr/share/codimux/"
    install -Dm755 codimux.py "$pkgdir/usr/share/codimux/codimux.py"

    install -dm755 "$pkgdir/usr/bin"
    printf '#!/bin/bash\nexec python3 /usr/share/codimux/codimux.py "$@"\n' \
        > "$pkgdir/usr/bin/codimux"
    chmod +x "$pkgdir/usr/bin/codimux"

    install -dm755 "$pkgdir/usr/share/applications"
    printf '[Desktop Entry]\nName=CoDiMux\nComment=ffmpeg GUI\nExec=/usr/bin/codimux\nIcon=codimux\nTerminal=false\nType=Application\nCategories=AudioVideo;Video;\n' \
        > "$pkgdir/usr/share/applications/codimux.desktop"

    if [[ -f "codimux.png" ]]; then
        for size in 16 32 48 64 128 256; do
            install -Dm644 codimux.png \
                "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/codimux.png"
            install -Dm644 codimux.png \
                "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/com.codismodiss.codimux.png"
        done
    fi
}
