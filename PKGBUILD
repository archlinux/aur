# Maintainer: Hari Chalise <harilvfs@chalisehari.com.np>
pkgname="carch"
pkgver=4.1.1
pkgrel=2
pkgdesc="An automated script for quick & easy Arch Linux system setup"
arch=(any)
url="https://github.com/harilvfs/$pkgname"
license=('GPL')
options=(!strip)
depends=(
    'bash'
    'man-pages'
    'zip'
    'gum'
    'git'
    'sed'
    'xdg-user-dirs'
    'wget'
    'figlet'
    'pacman'
    'unzip'
    'python'
    'gtk3'
    'noto-fonts-emoji'
    'ttf-joypixels'
    'curl'
    'tar'
)
optdepends=(
    'bash-completion: for Bash completion support'
    'zsh: for Zsh completion support'
    'fish: for Fish completion support'
)
conflicts=('carch-git')
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP')
sha256sums=('84bb856b5abbca0df9fb6ea97d86ada76ee1a85777bcd684eb14573ac9c85d63')

package() {

    install -Dm755 "$srcdir/$pkgname-$pkgver/build/$pkgname" -t "$pkgdir/usr/bin/"
    
    install -Dm755 "$srcdir/$pkgname-$pkgver/gtk/$pkgname-gtk.py" -t "$pkgdir/usr/bin/"
   
    install -d "$pkgdir/usr/bin/scripts"
    rm -f "$srcdir/$pkgname-$pkgver/scripts/README"
    cp -r "$srcdir/$pkgname-$pkgver/scripts/." -t "$pkgdir/usr/bin/scripts"
   
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -Dm644 "$srcdir/$pkgname-$pkgver/man/$pkgname.1" "$pkgdir/usr/share/man/man.1/$pkgname.1"

    install -Dm644 "$srcdir/$pkgname-$pkgver/completions/bash/$pkgname" "$pkgdir/usr/share/bash-completion/completions/$pkgname"

    install -Dm644 "$srcdir/$pkgname-$pkgver/completions/zsh/_$pkgname" "$pkgdir/usr/share/zsh/functions/Completion/Unix/_$pkgname"

    install -Dm644 "$srcdir/$pkgname-$pkgver/completions/fish/$pkgname.fish" "$pkgdir/usr/share/fish/completions/$pkgname.fish"

    for size in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "$srcdir/$pkgname-$pkgver/source/logo/product_logo_${size%%x*}.png" \
            "$pkgdir/usr/share/icons/hicolor/$size/apps/carch.png"
    done
}
