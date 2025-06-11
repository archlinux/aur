# Maintainer: secretlay3r secretlay3r@proton.me
pkgname=pokedex-terminal
pkgver=1.0
pkgrel=1
pkgdesc="1998 Pokemon in your terminal"
arch=('any')
url="https://github.com/secretlay3r/pokedex-terminal"
license=('MIT')
depends=('python')
source=("pokedex-terminal-${pkgver}.tar.gz")
sha256sums=('59751249e660cd59efa607b8e45bd78c3cf49d9bfd6bff0e15154c3a5db9c177')

package() {
    install -d "$pkgdir/usr/share/pokedex-terminal/sprite_data"
    install -m 644 "${srcdir}/pokedex-terminal-${pkgver}/sprite_data/"* "$pkgdir/usr/share/pokedex-terminal/sprite_data/"

    install -d "$pkgdir/usr/share/pokedex-terminal"
    install -m 755 "${srcdir}/pokedex-terminal-${pkgver}/pokedex-terminal.py" "$pkgdir/usr/share/pokedex-terminal/pokedex-terminal.py"

    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/pokemon" <<EOF
#!/bin/sh
exec /usr/bin/env python3 /usr/share/pokedex-terminal/pokedex-terminal.py "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/pokemon"
}