pkgbase=aa-snapshot-maker
pkgname=('aa-snapshot-maker-docs-bin' 'aa-snapshot-maker-standalone-bin')
pkgver=1.0.9
pkgrel=4
arch=('x86_64')
url="https://audioassault.mx/products/snapshot-maker"
license=('EULA')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs' 'unzip')
source=('AA Snapshot Maker.desktop'
        'aa-snapshot-maker.png')
sha256sums=('b8dcdabd714eaed0b4d06861c5dc6245529ca5e8ef90b46a927878494be17cd6'
            '2ccb54d693ba09c2f86750891f2d1ea090f74fe282c3268617d1519b58f79ad5')

prepare () {
	_archive="`xdg-user-dir DOWNLOAD`/SnapshotMakerLinux.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package_aa-snapshot-maker-docs-bin() {
    ## Install Docs
    pkgdesc="Audio Assault amp modeller preset maker (Documentation)"
    install -Dm644 "$srcdir/Snapshot Maker Manual.pdf" "$pkgdir/usr/share/doc/aa-snapshot-maker.pdf"
}

package_aa-snapshot-maker-standalone-bin() {
    ## Install Standalone Binary
    pkgdesc="Audio Assault amp modeller preset maker (Standalone)"
    groups=('pro-audio')
    install -Dm755 "$srcdir/Snapshot Maker" "$pkgdir/usr/bin/AA Snapshot Maker Standalone"
    install -Dm644 "$srcdir/AA Snapshot Maker.desktop" "$pkgdir/usr/share/applications/AA Snapshot Maker.desktop"
    install -Dm644 "$srcdir/aa-snapshot-maker.png" "$pkgdir/usr/share/icons/hicolor/192x192/apps/aa-snapshot-maker.png"
}
