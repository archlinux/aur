# Maintainer: Bjarne Øverli <bjarne@oever.li>
pkgname=jot-git
pkgver=1.3.1
pkgrel=1
pkgdesc="A single-purpose tool for capturing a thought before it disappears"
arch=('any')
url="https://github.com/bjarneo/omarchy-jot"
license=('MIT')
depends=('gjs' 'gtk4' 'libadwaita')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6d78d09976e2547b98eb6f39f8dd00f5f056092764a93e54fe1d0750ee8838f1')

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
exec gjs -m jot.js "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/jot"

    # Install the icon
    install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/jot.png"

    # Install the desktop file
    install -Dm644 jot.desktop "$pkgdir/usr/share/applications/jot.desktop"
}
