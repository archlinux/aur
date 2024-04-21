pkgbase=aa-snapshot-player
pkgname=('aa-snapshot-player-standalone-bin' 'aa-snapshot-player-vst3-bin')
pkgver=1.0.9
pkgrel=3
arch=('x86_64')
url="https://audioassault.mx/products/snapshot-player"
license=('EULA')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs' 'unzip')
optdepends=('amp-locker: amp modeller used to host plugin')
provides=('aa-snapshot-player')
source=('AA Snapshot Player.desktop'
        'aa-snapshot-player.png')
sha256sums=('ef8c5ffcd4bf1a184cf53c7802beb21451c0d62c6a92dba1fee946fbaa2ef659'
            '2ccb54d693ba09c2f86750891f2d1ea090f74fe282c3268617d1519b58f79ad5')

prepare () {
	_archive="`xdg-user-dir DOWNLOAD`/SnapshotPlayerLinux.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package_aa-snapshot-player-standalone-bin() {
    ## Install Standalone Binary
    pkgdesc="Audio Assault amp modeller preset player (Standalone)"
    groups=('pro-audio')
    install -Dm755 "$srcdir/Snapshot Player Standalone" "$pkgdir/usr/bin/AA Snapshot Player Standalone"
    install -Dm644 "$srcdir/AA Snapshot Player.desktop" "$pkgdir/usr/share/applications/AA Snapshot Player.desktop"
    install -Dm644 "$srcdir/aa-snapshot-player.png" "$pkgdir/usr/share/icons/hicolor/192x192/apps/aa-snapshot-player.png"
}

package_aa-snapshot-player-vst3-bin() {
    ## Install VST3 Plugin
    pkgdesc="Audio Assault amp modeller preset player (VST3)"
    groups=('pro-audio' 'vst3-plugins')
    install -Dm755 "$srcdir/Snapshot Player.vst3/Contents/x86_64-linux/Snapshot Player.so" "$pkgdir/usr/lib/vst3/AA Snapshot Player.vst3/Contents/x86_64-linux/AA Snapshot Player.so"
}

