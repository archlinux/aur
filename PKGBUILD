# Maintainer: Wraient <rushikeshwastaken@gmail.com>
pkgname='buttercup'
pkgver=v1.0.0
pkgrel=1
pkgdesc="Watch TV Shows / Movies from torrent."
arch=("x86_64")
url="https://github.com/Wraient/buttercup"
license=('GPL')
depends=('mpv' 'rofi' 'npm')
source=("buttercup::https://github.com/Wraient/buttercup/releases/latest/download/buttercup")
sha256sums=('SKIP')

pkgver() {
    # Fetch the latest release tag from GitHub and set it as pkgver
    local latest_release
    latest_release=$(curl -s https://api.github.com/repos/Wraient/buttercup/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')
    echo "$latest_release"
}

build() {
    # Install peerflix globally via npm
    npm install -g peerflix
}

package() {
    # Install the precompiled binary into /usr/bin
    install -Dm755 "$srcdir/buttercup" "$pkgdir/usr/bin/buttercup"
}
