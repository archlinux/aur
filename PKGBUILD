# Maintainer: Carlos <prietus@live.com>
pkgname=jlfine-bin
_pkgname=jlfine
pkgver=0.1.3
pkgrel=1
pkgdesc="Native Jellyfin desktop client with bit-perfect audio and HDR/Dolby Vision video (Slint + libmpv)"
arch=('x86_64')
url="https://github.com/prietus/jlfine"
license=('MIT')
# Runtime libraries the prebuilt binary loads. Verify with `namcap`.
depends=('mpv' 'alsa-lib' 'dbus' 'fontconfig' 'libxkbcommon' 'libglvnd' 'wayland')
provides=('jlfine')
conflicts=('jlfine')
# The binary comes from the GitHub release; icon/license/desktop are
# fetched from the repo at the matching tag (so the tag must be cut
# AFTER the icon + packaging files were added). Run `updpkgsums` to
# replace the SKIP placeholders with real checksums.
source=("jlfine-$pkgver::https://github.com/prietus/jlfine/releases/download/v$pkgver/jlfine-linux-x86_64"
        "jlfine-$pkgver.png::https://raw.githubusercontent.com/prietus/jlfine/v$pkgver/crates/jlfine-ui/ui/icon.png"
        "jlfine-$pkgver.desktop::https://raw.githubusercontent.com/prietus/jlfine/v$pkgver/packaging/jlfine.desktop"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/prietus/jlfine/v$pkgver/LICENSE")
sha256sums=('307751e5d8b4c5aec5330124029a8ac18381435b7f6c54118dee1467bedd3f45'
            'acde7cddefcb2733fc4cd592a5e4d2e7aa0eac452f9092d35ea27c36fc64c0a7'
            'edfd28b3a72b473fff05ceac56b8c170f4fe8d853de1300976f5a885448cf8bb'
            '0e87f8768a2d1e3e648c5bbf5d02261ca12be722dce4d25fc51d2c610e03ab32')

package() {
	install -Dm755 "jlfine-$pkgver" "$pkgdir/usr/bin/jlfine"
	install -Dm644 "jlfine-$pkgver.png" "$pkgdir/usr/share/pixmaps/jlfine.png"
	install -Dm644 "jlfine-$pkgver.desktop" "$pkgdir/usr/share/applications/jlfine.desktop"
	install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
