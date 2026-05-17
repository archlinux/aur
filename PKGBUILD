# Maintainer: Cristiandis <pizzaoven@izzoserver.top>
pkgname=pizzaoven-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Cross-platform mod manager for Pizza Tower"
arch=('x86_64')
url="https://github.com/Cristiandis/PizzaOven-Avalonia"
license=('GPL3')
depends=('dotnet-runtime-8.0' 'xdelta3')
provides=('pizzaoven')
conflicts=('pizzaoven')
options=('!strip')
source=("PizzaOven-linux-x64.tar.gz::https://github.com/Cristiandis/PizzaOven-Avalonia/releases/download/v$pkgver/PizzaOven-linux-x64.tar.gz")
sha256sums=('8bd1df94e8c0a042e5a5e720aaf8fb0bf01afc7f17ef6a70cb975290fdd7b11e')

package() {
    install -Dm755 PizzaOven "$pkgdir/usr/lib/pizzaoven/PizzaOven"

    # Wrapper script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/pizzaoven" << 'WRAPPER'
#!/bin/sh
exec /usr/lib/pizzaoven/PizzaOven "$@"
WRAPPER
    chmod 755 "$pkgdir/usr/bin/pizzaoven"

    # App desktop entry
    install -dm755 "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/pizzaoven.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Pizza Oven+
Comment=Mod manager for Pizza Tower
Exec=/usr/bin/pizzaoven
Icon=pizzaoven
Type=Application
Categories=Game;
DESKTOP

    # URI handler desktop entry
    cat > "$pkgdir/usr/share/applications/pizzaoven-handler.desktop" << 'DESKTOP'
[Desktop Entry]
Name=Pizza Oven+
Exec=/usr/bin/pizzaoven -download %u
Type=Application
NoDisplay=true
MimeType=x-scheme-handler/pizzaovenplus;
DESKTOP

install -Dm644 "$srcdir/pizzaoven.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/pizzaoven.png"
}
