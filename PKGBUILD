# Maintainer: Bjarne Øverli <bjarne.oeverli@gmail.com>
pkgname=jot-git
pkgver=1.2.0
pkgrel=1
pkgdesc="A single-purpose tool for capturing a thought before it disappears"
arch=('any')
url="https://github.com/bjarneo/omarchy-jot"
license=('MIT')
depends=('gjs' 'gtk4' 'libadwaita')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b2f756958ad6af7ef375f0286028bf0fc4f7f533e073f10b77b3b6bdeea31c12')

package() {
    cd "$srcdir/omarchy-jot-$pkgver"

    # Install source files
    install -dm755 "$pkgdir/usr/share/jot"
    install -Dm644 jot.js "$pkgdir/usr/share/jot/jot.js"
    cp -r src "$pkgdir/usr/share/jot/"

    # Create launcher script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/jot" << 'EOF'
#!/bin/bash
cd /usr/share/jot || exit
exec gjs jot.js "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/jot"

    # Install the icon
    install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/jot.png"

    # Install the desktop file
    install -Dm644 jot.desktop "$pkgdir/usr/share/applications/jot.desktop"
}
