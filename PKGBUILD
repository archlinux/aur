# Maintainer: Nicolas Szabo <nsz32@github>
pkgname=abird-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Desktop redistributable isolated browser - turns websites into standalone apps"
arch=('x86_64')
url="https://github.com/nsz32/abird"
license=('MIT')
depends=('electron39')
replaces=('bird-apps-bin')
conflicts=('bird-apps-bin')
options=('!strip' '!debug')
install=abird-bin.install
source=(
    "https://github.com/nsz32/abird/releases/download/v${pkgver}/ABird-${pkgver}-asar-linux-x64.tar.zst"
    "https://raw.githubusercontent.com/nsz32/abird/v${pkgver}/icon.svg"
    "abird.desktop"
    "abird.sh"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
noextract=("ABird-${pkgver}-asar-linux-x64.tar.zst")

package() {
    cd "$srcdir"

    # Extract asar tarball
    tar --zstd -xf "ABird-${pkgver}-asar-linux-x64.tar.zst"

    # Install asar and unpacked native modules
    install -dm755 "$pkgdir/usr/lib/abird"
    install -Dm644 abird.asar "$pkgdir/usr/lib/abird/abird.asar"
    cp -r abird.asar.unpacked "$pkgdir/usr/lib/abird/"

    # Install launcher script
    install -Dm755 abird.sh "$pkgdir/usr/bin/abird"

    # Install desktop file and icon
    install -Dm644 abird.desktop "$pkgdir/usr/share/applications/abird.desktop"
    install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/abird.svg"
}
