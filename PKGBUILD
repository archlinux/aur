pkgbase=amp-locker
pkgname=('amp-locker-standalone-bin' 'amp-locker-vst3-bin')
pkgver=1.0.9
pkgrel=1
arch=('x86_64')
url="https://audioassault.mx/collections/amp-locker-gear/products/amp-locker"
license=('EULA')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs' 'unzip')
optdepends=('aa-snapshot-player: special amp modeller preset player plugin')
source=('Amp Locker.desktop'
        'Amp Locker Linker'
        'amp-locker.png')
sha256sums=('4b24069c18f9b4542d61b43b1985f0e9768c4cd829facf5eeaab9333797b8974'
            '088a438fe8f8c045c6a6d662e55671c84d36ee6ec4ce1dee4a6b6ec3f334d559'
            '2ccb54d693ba09c2f86750891f2d1ea090f74fe282c3268617d1519b58f79ad5')

prepare () {
	_archive="`xdg-user-dir DOWNLOAD`/AmpLockerLinux.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package_amp-locker-standalone-bin() {
    ## Install Standalone Binary
    pkgdesc="Audio Assault Multamp Simulator (Standalone)"
    groups=('pro-audio')
    install -Dm755 "$srcdir/Amp Locker Linker" "$pkgdir/usr/bin/Amp Locker Linker"
    install -Dm755 "$srcdir/Amp Locker StandAlone" "$pkgdir/usr/bin/Amp Locker StandAlone"
    install -Dm644 "$srcdir/Amp Locker.desktop" "$pkgdir/usr/share/applications/Amp Locker.desktop"
    install -Dm644 "$srcdir/amp-locker.png" "$pkgdir/usr/share/icons/hicolor/192x192/apps/amp-locker.png"
}

package_amp-locker-vst3-bin() {
    ## Install VST3 Plugin
    pkgdesc="Audio Assault Multamp Simulator (VST3)"
    groups=('pro-audio' 'vst3-plugins')
    install -Dm755 "$srcdir/Amp Locker.vst3/Contents/x86_64-linux/Amp Locker.so" "$pkgdir/usr/lib/vst3/Amp Locker.vst3/Contents/x86_64-linux/Amp Locker.so"
}

