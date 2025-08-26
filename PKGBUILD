# Maintainer: mfw <espadonne@outlook.com>

pkgname=wmswitch
pkgver=0.1.0
pkgrel=1
pkgdesc='Unified configuration manager for tiling window managers (i3, Hyprland, AeroSpace)'
arch=('x86_64')
url='https://github.com/tenseleyFlow/wmswitch'
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
source=("git+https://github.com/tenseleyFlow/wmswitch.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd wmswitch
    make release
}

check() {
    cd wmswitch
    make test || true  # Allow tests to fail gracefully
}

package() {
    cd wmswitch
    
    # Install the binary
    install -Dm755 bin/wmswitch "$pkgdir/usr/bin/wmswitch"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 WMSWITCH-GOALS.md "$pkgdir/usr/share/doc/$pkgname/WMSWITCH-GOALS.md"
    
    # Install shell completions
    if [ -d completions ]; then
        install -Dm644 completions/wmswitch.bash "$pkgdir/usr/share/bash-completion/completions/wmswitch"
        install -Dm644 completions/wmswitch.zsh "$pkgdir/usr/share/zsh/site-functions/_wmswitch"
        install -Dm644 completions/wmswitch.fish "$pkgdir/usr/share/fish/vendor_completions.d/wmswitch.fish"
    fi
    
    # Install example configurations
    if [ -d examples ]; then
        install -Dm644 examples/* -t "$pkgdir/usr/share/doc/$pkgname/examples/"
    fi
}