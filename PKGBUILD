# Release automation replaces pkgver and the archive checksum before publication.
pkgname=trackfolio-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Manage FLAC and MP3 metadata in a local music catalog'
arch=('x86_64')
url='https://github.com/Evilchuck666/Trackfolio'
license=('GPL-3.0-only')
depends=('glibc>=2.39' 'gcc-libs' 'zlib' 'fontconfig' 'freetype2' 'libglvnd'
         'libx11' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'xcb-util-cursor'
         'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm'
         'wayland' 'dbus')
provides=("trackfolio=$pkgver")
conflicts=('trackfolio')
options=('!strip' '!debug')
source=("trackfolio-${pkgver}-linux-x64.tar.gz::${url}/releases/download/v${pkgver}/Trackfolio-linux-x64.tar.gz"
        'trackfolio.desktop' 'trackfolio.svg')
# scripts/prepare_aur.py fills these checksums from the verified release inputs.
sha256sums=('b73d677f1f3969ed3e82aecfb787a30eee6f9319e994765296d265707424b858'
            '407c8b23864edb6bc66879a5f646e6c5356f8758e08c01220ff9225c826bbb6c' '250fa792ce18d2ec3a42e616d6ffd10a0d2eb8966a8f41084f19b2abb646fc71')

package() {
    install -Dm755 "$srcdir/Trackfolio" "$pkgdir/usr/bin/trackfolio"
    install -Dm644 "$srcdir/trackfolio.desktop" "$pkgdir/usr/share/applications/trackfolio.desktop"
    install -Dm644 "$srcdir/trackfolio.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/trackfolio.svg"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
