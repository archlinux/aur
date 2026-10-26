# Maintainer: 9M2PJU <9m2pju@gmail.com>
pkgname=loaf-fm
pkgver=0.2.0
pkgrel=1
pkgdesc="Material 3 Expressive File Manager built with Qt6 Quick and Rust"
arch=('x86_64')
url="https://github.com/m-uvex/loaf-fm"
license=('MIT')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-wayland' 'glibc' 'gcc-libs' 'hicolor-icon-theme')
makedepends=('cargo' 'rust' 'cmake' 'ninja' 'pkgconf' 'clang')
optdepends=('7zip: zip/7z/rar/iso and encrypted archives'
            'udisks2: mount, eject and unlock drives'
            'ffmpegthumbnailer: video thumbnails'
            'xdg-utils: open files with their default application'
            'libsecret: remember encrypted drive passphrases'
            'polkit: Open as Administrator')
provides=('loaf')
conflicts=('loaf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/m-uvex/loaf-fm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a434f160b1ca236f8c0592826f2aa2477672c966cd9cf0934fbc148f83e5f8f1')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/loaf" "$pkgdir/usr/bin/loaf"
    install -Dm644 "packaging/assets/loaf.desktop" "$pkgdir/usr/share/applications/loaf.desktop"
    for sz in 16 32 48 64 128 256 512; do
        install -Dm644 "packaging/assets/icons/hicolor/${sz}x${sz}/apps/loaf.png" \
            "$pkgdir/usr/share/icons/hicolor/${sz}x${sz}/apps/loaf.png"
    done
    install -Dm644 "packaging/assets/icons/hicolor/scalable/apps/loaf.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/loaf.svg"
}
