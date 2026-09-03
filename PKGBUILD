# Maintainer: Octopus118 <idlansdowne at gmail dot com>

pkgname=foxglove-bin
pkgver=3.1.0
pkgrel=1
pkgdesc='An integrated visualization and diagnosis tool for robotics'
arch=('x86_64' 'aarch64')
license=('MPL')
url='https://docs.foxglove.dev/changelog'
depends=(gtk3 libnotify nss libxtst xdg-utils at-spi2-core libdrm egl-gbm libxcb)
optdepends=(libappindicator-gtk3)
provides=('foxglove-studio')
conflicts=('foxglove-studio')
replaces=('foxglove-studio-bin')
source_x86_64=("$pkgname-$pkgver-x86_64.deb::https://get.foxglove.dev/desktop/v$pkgver/foxglove-studio-$pkgver-linux-amd64.deb")
source_aarch64=("$pkgname-$pkgver-aarch64.deb::https://get.foxglove.dev/desktop/v$pkgver/foxglove-studio-$pkgver-linux-arm64.deb")
sha256sums_x86_64=('cc703d9fbf5ecbc956bf342dcedf01e4cc7ffcb04adba31c5e44268d8d90284c')
sha256sums_aarch64=('41d5afac04db30f3887d4c4b19c0ed61e07c5945a7db5abcfa54f3f043a13ad4')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

    install -Dm644 "$pkgdir/usr/share/icons/hicolor/512x512/apps/foxglove-studio.png" "$pkgdir/usr/share/pixmaps/foxglove-studio.png"

    sed -i 's|/opt/Foxglove/foxglove-studio|/usr/bin/foxglove-studio|' "$pkgdir/usr/share/applications/foxglove-studio.desktop"

    ## Symlink binary which is located in /opt
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/opt/Foxglove/foxglove-studio" "$pkgdir/usr/bin/foxglove-studio"
}
