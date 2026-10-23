# Maintainer: Octopus118 <idlansdowne at gmail dot com>

pkgname=foxglove-bin
pkgver=3.4.2
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
source=("foxglove-studio.desktop.patch" "foxglove-studio.xml.patch")
sha256sums=('d908f3b083609c265f07cfb681d7c7735c4f65eecf299adbeaee63c72680cbc5'
            'c314574bc3fe3dd75290e313c2de4e3c9cb2040c3056bfb8433bfd0778484de2')
sha256sums_x86_64=('16479df6f19a88358ff681fb178d501927613e970460309cffc80df513964d82')
sha256sums_aarch64=('07b5a3bad6c83dac9b69a08f7648674aa768661571cab6c8b8bee2e0bb23122c')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

    install -Dm644 "$pkgdir/usr/share/icons/hicolor/512x512/apps/foxglove-studio.png" "$pkgdir/usr/share/pixmaps/foxglove-studio.png"

    sed -i 's|/opt/Foxglove/foxglove-studio|/usr/bin/foxglove-studio|' "$pkgdir/usr/share/applications/foxglove-studio.desktop"

    patch -d "$pkgdir" -p0 < "$srcdir/foxglove-studio.desktop.patch"
    patch -d "$pkgdir" -p0 < "$srcdir/foxglove-studio.xml.patch"

    ## Symlink binary which is located in /opt
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/opt/Foxglove/foxglove-studio" "$pkgdir/usr/bin/foxglove-studio"
}
