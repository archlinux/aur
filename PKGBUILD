# Maintainer: Eran Sandler <eran@sandler.co.il>
pkgname=hyprmon-bin
pkgver=0.0.17
pkgrel=1
pkgdesc="A multi-monitor profile manager for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/erans/hyprmon"
license=('Apache-2.0') 
depends=('hyprland')
source=('hyprmon.desktop' 'hyprmon.png')
source_x86_64=("hyprmon-${pkgver}-linux-amd64::${url}/releases/download/v${pkgver}/hyprmon-linux-amd64.tar.gz")
source_aarch64=("hyprmon-${pkgver}-linux-arm64::${url}/releases/download/v${pkgver}/hyprmon-linux-arm64.tar.gz")
sha256sums=('SKIP' 'SKIP')
sha256sums_x86_64=('0d21d9845183e12be640b622ed5adcaa04f77e835cc3671a26a291caf7f2e9c9')
sha256sums_aarch64=('f675a01a1ce43b2d219bb5dba23fbc3d4016fbc1fd9b217c6851068fe1264354')

package() {
    cd "$srcdir"

    if [[ $CARCH == "x86_64" ]]; then
        mv hyprmon-linux-amd64 hyprmon 
    elif [[ $CARCH == "aarch64" ]]; then
        mv hyprmon-linux-arm64 hyprmon 
    else
        echo "Unsupported architecture: $CARCH"
        exit 1
    fi

    # Install the binary (tar.gz should extract just the binary)
    install -Dm755 "hyprmon" "$pkgdir/usr/bin/hyprmon"

    # Install desktop file
    install -Dm644 "hyprmon.desktop" "$pkgdir/usr/share/applications/hyprmon.desktop"

    # Install icon
    install -Dm644 "hyprmon.png" "$pkgdir/usr/share/pixmaps/hyprmon.png"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/hyprmon/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/hyprmon/README.md"
}
