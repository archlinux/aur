# Maintainer: 9M2PJU <9m2pju@gmail.com>
# Tracks the rolling nightly release of Loaf (upstream m-uvex/loaf-fm).
# Nightly commit: aad33b3d2c3afd647b3c90bced3fd5b1e6a7ce9c (2026-11-10)
# See https://github.com/m-uvex/loaf-fm/discussions/116

pkgname=loaf-fm-nightly-bin
# Upstream Cargo version + nightly date (YYYYMMDD). Bump pkgver (and the
# commit comment above) each time you want AUR helpers to see an update.
pkgver=0.3.0.nightly.20261110
pkgrel=1
pkgdesc="Material 3 Expressive File Manager built with Qt6 Quick and Rust (nightly binary)"
arch=('x86_64')
url="https://github.com/m-uvex/loaf-fm"
license=('MIT')
depends=('glibc' 'libgcc' 'libstdc++' 'qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-wayland' 'hicolor-icon-theme')
optdepends=('7zip: zip/7z/rar/iso and encrypted archives'
            'udisks2: mount, eject and unlock drives'
            'ffmpegthumbnailer: video thumbnails'
            'xdg-utils: open files with their default application'
            'libsecret: remember encrypted drive passphrases'
            'polkit: Open as Administrator')
provides=('loaf-fm' 'loaf')
conflicts=('loaf-fm' 'loaf-fm-bin' 'loaf-fm-git' 'loaf-fm-nightly-git' 'loaf')
options=('!strip')
# Rolling release: upstream overwrites this file on every nightly run,
# so the checksum cannot be pinned.
source_x86_64=("loaf-nightly-$CARCH.pkg.tar.zst::https://github.com/m-uvex/loaf-fm/releases/download/nightly/loaf-nightly-x86_64.pkg.tar.zst")
sha256sums_x86_64=('SKIP')

noextract=("loaf-nightly-$CARCH.pkg.tar.zst")

package() {
    cd "$pkgdir"
    tar --exclude='.PKGINFO' --exclude='./.*' -xf "$srcdir/loaf-nightly-$CARCH.pkg.tar.zst"

    # Normalize doc/license dirs to this pkgname (tarball uses 'loaf/')
    if [ -d "$pkgdir/usr/share/doc/loaf" ] && [ ! -e "$pkgdir/usr/share/doc/$pkgname" ]; then
        mv "$pkgdir/usr/share/doc/loaf" "$pkgdir/usr/share/doc/$pkgname"
    fi
    if [ -d "$pkgdir/usr/share/licenses/loaf" ] && [ ! -e "$pkgdir/usr/share/licenses/$pkgname" ]; then
        mv "$pkgdir/usr/share/licenses/loaf" "$pkgdir/usr/share/licenses/$pkgname"
    fi
}
