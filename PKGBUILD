# Maintainer: Octopus118 <idlansdowne at gmail dot com>

pkgname=foxglove-bin
pkgver=2.25.0
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
source_x86_64=("$pkgname-$pkgver-x86_64.deb::https://get.foxglove.dev/desktop/v$pkgver/foxglove-studio-$pkgver-linux-amd64.deb")
source_aarch64=("$pkgname-$pkgver-aarch64.deb::https://get.foxglove.dev/desktop/v$pkgver/foxglove-studio-$pkgver-linux-arm64.deb")
sha256sums_x86_64=('a5c99f78900399cd0dda8b54baf25cc059b34802a1e36c72471b66684488f6f9')
sha256sums_aarch64=('6c98750eccceb78b78822fc8309c217a0229cb521330a90fcb57d8ca823b6e16')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

    install -Dm644 "$pkgdir/usr/share/icons/hicolor/512x512/apps/foxglove-studio.png" "$pkgdir/usr/share/pixmaps/foxglove-studio.png"

    sed -i 's|/opt/Foxglove/foxglove-studio|/usr/bin/foxglove-studio|' "$pkgdir/usr/share/applications/foxglove-studio.desktop"

    ## Symlink binary which is located in /opt
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/opt/Foxglove/foxglove-studio" "$pkgdir/usr/bin/foxglove-studio"
}
