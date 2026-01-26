# Maintainer: Nicolas Szabo <nsz32@github>
pkgname=bird-apps-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Desktop redistributable isolated browser - turns websites into standalone apps"
arch=('x86_64')
url="https://github.com/nsz32/bird"
license=('MIT')
depends=('electron39')
options=('!strip' '!debug')
install=bird-apps-bin.install
source=(
    "https://github.com/nsz32/bird/releases/download/v${pkgver}/Bird-${pkgver}-asar-linux-x64.tar.zst"
    "https://raw.githubusercontent.com/nsz32/bird/v${pkgver}/icon.svg"
    "bird-apps.desktop"
    "bird-apps.sh"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
noextract=("Bird-${pkgver}-asar-linux-x64.tar.zst")

package() {
    cd "$srcdir"

    # Extract asar tarball
    tar --zstd -xf "Bird-${pkgver}-asar-linux-x64.tar.zst"

    # Install asar and unpacked native modules
    install -dm755 "$pkgdir/usr/lib/bird"
    install -Dm644 bird.asar "$pkgdir/usr/lib/bird/bird.asar"
    cp -r bird.asar.unpacked "$pkgdir/usr/lib/bird/"

    # Install launcher script
    install -Dm755 bird-apps.sh "$pkgdir/usr/bin/bird-apps"

    # Install desktop file and icon
    install -Dm644 bird-apps.desktop "$pkgdir/usr/share/applications/bird-apps.desktop"
    install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/bird-apps.svg"
}
