# Maintainer: Ivan Dudkin <dudkinivan1245@gmail.com>
pkgname=e6-web-client
pkgver=0.0.0
pkgrel=1
pkgdesc="A beautiful, modern client for e621/e926"
arch=('x86_64')
url="https://github.com/Ivannivi/e6client"
license=('MIT')
depends=('electron')
makedepends=('git' 'npm')
source=("$pkgname::git+https://github.com/Ivannivi/e6client.git#tag=v$pkgver"
        "$pkgname.desktop"
        "$pkgname.sh")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "$pkgname"
    npm install
}

build() {
    cd "$pkgname"
    npm run build
    npm install -g electron-builder
    electron-builder --linux --publish=never
}

package() {
    cd "$pkgname"

    # Install AppImage
    install -Dm755 "dist/*.AppImage" "$pkgdir/usr/bin/$pkgname"

    # Install desktop file
    install -Dm644 "../$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Install icon (you'll need to add an icon file)
    # install -Dm644 "path/to/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}