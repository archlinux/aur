# Maintainer: Max Berggren <maxberggren@gmail.com>
pkgname=jotite
pkgver=2.2.2
pkgrel=1
pkgdesc="A lightweight, fun, distraction-free markdown note-taking app with live markdown rendering"
arch=('any')
url="https://github.com/maxberggren/omarchy-jotite"
license=('MIT')
depends=('gjs' 'gtk4' 'libadwaita' 'fontconfig')
install=jotite.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6a0c05a6a136337fcc1bbba96315367870c1c2109a105baa9547664e5c0b6cf0')

package() {
    cd "$srcdir/omarchy-jotite-$pkgver"

    # Install the main script
    install -Dm755 jotite.js "$pkgdir/usr/bin/jotite"

    # Install desktop file
    install -Dm644 jotite.desktop "$pkgdir/usr/share/applications/jotite.desktop"

    # Install icon
    install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/jotite.png"

    # Install custom font (pxlxxl)
    install -Dm644 pxlxxl.ttf "$pkgdir/usr/share/fonts/jotite/pxlxxl.ttf"
    
    # Install font license
    install -Dm644 pxlxxl-eula.txt "$pkgdir/usr/share/licenses/$pkgname/pxlxxl-eula.txt"
    
    # Install fontconfig configuration
    install -Dm644 /dev/stdin "$pkgdir/etc/fonts/conf.avail/69-jotite.conf" <<'EOF'
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <dir>/usr/share/fonts/jotite</dir>
</fontconfig>
EOF
}