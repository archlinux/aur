# Maintainer: Yaroslav Krytsun <slavko7 at gmail dot com>
pkgname=monokular
pkgver=1.0.0
pkgrel=3
pkgdesc="Export PDF pages as images with preview — one thing, done well"
arch=('any')
url="https://github.com/dyedfox/monokular"
license=('GPL-3.0-or-later')
depends=(
    'python'
    'python-pyqt6'
    'python-pymupdf'
)
makedepends=('git')
source=("$pkgname-$pkgver::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install app files
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    cp -r app/ main.py "$pkgdir/usr/lib/$pkgname/"

    # Install icon
    install -Dm644 assets/icon.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"

    # Install desktop file
    install -Dm644 "$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Create launcher script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$pkgname" << 'EOF'
#!/bin/sh
exec python3 /usr/lib/monokular/main.py "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$pkgname"
}
