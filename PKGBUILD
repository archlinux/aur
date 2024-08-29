pkgbase=5db5-channel
pkgname=('5db5-channel-lv2-bin' '5db5-channel-vst3-bin')
pkgver=1.0.1
pkgrel=1
arch=('x86_64')
url="https://audioassault.mx/plugin/Channel551"
license=('EULA')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs' 'unzip')
provides=('5db5-channel')

prepare () {
	_archive="`xdg-user-dir DOWNLOAD`/Channel551Linux.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package_5db5-channel-lv2-bin() {
    ## Install LV2 Plugin
    pkgdesc="British Style Channel Strip (LV2)"
    groups=('pro-audio' 'lv2-plugins')
    install -Dm755 "$srcdir/Channel551.lv2/Channel551.so" "$pkgdir/usr/lib/lv2/Channel551.lv2/Channel551.so"
    install -Dm644 "$srcdir/Channel551.lv2/dsp.ttl" "$pkgdir/usr/lib/lv2/Channel551.lv2/dsp.ttl"
    install -Dm644 "$srcdir/Channel551.lv2/manifest.ttl" "$pkgdir/usr/lib/lv2/Channel551.lv2/manifest.ttl"
    install -Dm644 "$srcdir/Channel551.lv2/ui.ttl" "$pkgdir/usr/lib/lv2/Channel551.lv2/ui.ttl"
}

package_5db5-channel-vst3-bin() {
    ## Install VST3 Plugin
    pkgdesc="British Style Channel Strip (VST3)"
    groups=('pro-audio' 'vst3-plugins')
    install -Dm755 "$srcdir/Channel551.vst3/Contents/Resources/moduleinfo.json" "$pkgdir/usr/lib/vst3/Channel551.vst3/Contents/Resources/moduleinfo.json"
    install -Dm755 "$srcdir/Channel551.vst3/Contents/x86_64-linux/Channel551.so" "$pkgdir/usr/lib/vst3/Channel551.vst3/Contents/x86_64-linux/Channel551.so"
}
