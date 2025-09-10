# Maintainer: Syed Ali Rizvi <rizvihuihuihui@icloud.com> 
pkgname=vimasm
pkgver=1.0.0
pkgrel=1
pkgdesc="Neovim setup with a default welcome.asm demo"
arch=('any')
url="https://github.com/sanecodeguy/vimasm"
license=('MIT')
depends=('neovim')
makedepends=('git')
source=("git+$url.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"

    install -Dm644 welcome.asm "$pkgdir/usr/share/$pkgname/welcome.asm"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md" 
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/vimasm" <<'EOF'
#!/bin/bash
VIMASM_DIR="$HOME/.config/vimasm"
VIMASM_DEMO="$VIMASM_DIR"
mkdir -p "$VIMASM_DEMO"

# Copy demo if missing
if [ ! -f "$VIMASM_DEMO/welcome.asm" ]; then
    cp /usr/share/vimasm/welcome.asm "$VIMASM_DEMO/"
fi

# Always open welcome.asm if no args
if [ $# -eq 0 ]; then
    exec nvim "$VIMASM_DEMO/welcome.asm"
else
    exec nvim "$@"
fi
EOF
}

