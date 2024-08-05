# Maintainer: Octopus118 <idlansdowne at gmail dot com>

pkgname=foxglove-bin
pkgver=2.10.0
pkgrel=1
pkgdesc='An integrated visualization and diagnosis tool for robotics'
arch=('x86_64' 'aarch64')
license=('MPL')
url='https://foxglove.dev/'
depends=()
optdepends=()
provides=('foxglove-studio')
conflicts=('foxglove-studio')
replaces=('foxglove-studio-bin')
source_x86_64=("$pkgname-$pkgver-x86_64.deb::https://get.foxglove.dev/desktop/latest/foxglove-studio-$pkgver-linux-amd64.deb")
source_aarch64=("$pkgname-$pkgver-aarch64.deb::https://get.foxglove.dev/desktop/latest/foxglove-studio-$pkgver-linux-arm64.deb")
sha256sums_x86_64=('b9514f8eb16a01a0f064035caee8c84a265bce935a693fd025198af081e4075f')
sha256sums_aarch64=('a367f53da75aaf8221de95596168883b2b992979f435827a950cbf752bdc53f4')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

    install -Dm644 "$pkgdir/usr/share/icons/hicolor/512x512/apps/foxglove-studio.png" "$pkgdir/usr/share/pixmaps/foxglove-studio.png"

    ## Remove space in name
    mv "$pkgdir/opt/Foxglove Studio" "$pkgdir/opt/foxglove-studio"
    sed -i 's|/opt/Foxglove Studio/foxglove-studio|/usr/bin/foxglove-studio|' "$pkgdir/usr/share/applications/foxglove-studio.desktop"

    ## Symlink binary which is located in /opt
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/opt/foxglove-studio/foxglove-studio" "$pkgdir/usr/bin/foxglove-studio"
}
