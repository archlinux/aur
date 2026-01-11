# Maintainer: Warren Wu <warrenweiwu04@gmail.com>
pkgname=wallflower
pkgver=0.0.2
pkgrel=1
pkgdesc="gui wallpaper manager for hyprland"
arch=('x86_64')
url="https://github.com/WarrenWu4/wallflower"
license=('MIT')
depends=('hyprland' 'hyprpaper' 'zenity' 'libx11' 'mesa')
makedepends=('git' 'gcc' 'make')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('6715375a729e69b6b7a6b7241caa909bd2a063ea13ecc9dfee0f9e88595bb793')
options=('!debug' '!strip')

build() {
    cd "$srcdir/$pkgname"
    make prod
}

package() {
    cd "$srcdir/$pkgname"
    
    # install binary to /usr/bin
    # -D flag automatically creates directory
    install -Dm755 build/prod/main "$pkgdir/usr/bin/$pkgname"

    # move resources to /usr/share/wallflower
    install -d "$pkgdir/usr/share/$pkgname"
    cp -r resources/* "$pkgdir/usr/share/$pkgname/"

    # add desktop entry in /usr/share/applications
    install -Dm644 wallflower.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

    # set app icon in /usr/share/icons/hicolor/...
    install -Dm644 wallflower.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"

    # REQUIRED: install License file
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
