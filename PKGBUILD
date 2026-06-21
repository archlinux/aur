# Maintainer: Octopus118 <idlansdowne at gmail dot com>

pkgname=foxglove-bin
pkgver=2.55.0
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
sha256sums_x86_64=('45b2b0bb708068dd1ce5c45634e4475b7b6f9ba994a85931b3d7b2b37db900eb')
sha256sums_aarch64=('71c3dd49caf50e5e63b817a87efd000df2c07b6ff9b4f08ae998e3bd9f011b74')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

    install -Dm644 "$pkgdir/usr/share/icons/hicolor/512x512/apps/foxglove-studio.png" "$pkgdir/usr/share/pixmaps/foxglove-studio.png"

    sed -i 's|/opt/Foxglove/foxglove-studio|/usr/bin/foxglove-studio|' "$pkgdir/usr/share/applications/foxglove-studio.desktop"

    ## Symlink binary which is located in /opt
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/opt/Foxglove/foxglove-studio" "$pkgdir/usr/bin/foxglove-studio"
}
