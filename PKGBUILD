# Maintainer: Eran Sandler <eran@sandler.co.il>
pkgname=hyprmon-bin
pkgver=0.0.7
pkgrel=4
pkgdesc="A multi-monitor profile manager for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/erans/hyprmon"
license=('Apache-2.0') 
depends=('hyprland')
source_x86_64=("hyprmon-${pkgver}-linux-amd64::${url}/releases/download/v${pkgver}/hyprmon-linux-amd64.tar.gz")
source_aarch64=("hyprmon-${pkgver}-linux-arm64::${url}/releases/download/v${pkgver}/hyprmon-linux-arm64.tar.gz")
sha256sums_x86_64=('sha256:eafbb8cc7a88d755481f82d537b099bb27d510161bc3fa7e905a9b89495e5bf3')
sha256sums_aarch64=('sha256:55101b6fde686b7b2e849c3323a5d7eae99ee82ffb7b9c16c0ae7301585cefe2')

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

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/hyprmon/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/hyprmon/README.md"
}
