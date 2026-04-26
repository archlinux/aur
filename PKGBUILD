# Maintainer: Abdulkadir Yildirim <contact@kadiryildirim.me>
pkgname=victus16-keyboard-ui
pkgver=1.0.5
pkgrel=1
pkgdesc="HP Victus 16 Keyboard RGB Backlight Controller (GTK4)"
arch=('any')
url="https://github.com/kadir-y/victus16-keyboard-ui"
license=('MIT')
depends=('python' 'gtk4' 'python-gobject')
makedepends=('git')
install=victus16-keyboard.install

source=(
    "git+https://github.com/kadir-y/victus16-keyboard-ui.git#branch=main"
)
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 "keyboard_controller.py" \
        "$pkgdir/usr/bin/victus16-keyboard"

    # Install the Python package modules
    mkdir -p "$pkgdir/usr/lib/victus16-keyboard"
    cp -r "keyboard_controller" "$pkgdir/usr/lib/victus16-keyboard/"
    
    # Fix permissions for package contents
    find "$pkgdir/usr/lib/victus16-keyboard/keyboard_controller" -type f -exec chmod 644 {} +
    find "$pkgdir/usr/lib/victus16-keyboard/keyboard_controller" -type d -exec chmod 755 {} +

    install -Dm644 "com.victus16.keyboard.desktop" \
        "$pkgdir/usr/share/applications/com.victus16.keyboard.desktop"

    install -Dm644 "com.victus16.keyboard.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.victus16.keyboard.png"

    install -Dm440 "victus16-keyboard-sudoers" \
        "$pkgdir/etc/sudoers.d/victus16-keyboard"
}
