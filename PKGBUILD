pkgbase=doubletake
pkgname=('doubletake-data-bin' 'doubletake-lv2-bin' 'doubletake-vst3-bin')
pkgver=1.0.0
pkgrel=4
arch=('x86_64')
url="https://audioassault.mx/plugin/DoubleTake"
license=('EULA')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs' 'unzip')
provides=('doubletake')
source=('Double Take Linker'
        'https://5db5public.s3.amazonaws.com/DoubleTakeLinux.zip')
sha256sums=('ad956063615ed59a0ba9da17c785c8058d930ade9e12279651bc9c7c42a386b6'
            '385b7cbff913dc3499fca33fce8d2cd5d471455b1aee32aa53a00e60ce68c3f5')



package_doubletake-data-bin() {
    ## Install Asset Data
    pkgdesc="Vocal Take Processor Plugin (Data Assets)"
    groups=('pro-audio')

    ## Make data assets dir
    mkdir -p "$pkgdir/usr/lib/5db5/DoubleTake/Presets"

    ## Copy assets to data directory
    cp -r "$srcdir/DoubleTakeLinux/Presets"/* "$pkgdir/usr/lib/5db5/DoubleTake/Presets"

    ## Install Double Take Linker Script
    install -Dm755 "$srcdir/Double Take Linker" "$pkgdir/usr/bin/Double Take Linker"
}

package_doubletake-lv2-bin() {
    ## Install LV2 Plugin
    pkgdesc="Vocal Take Processor Plugin (LV2)"
    depends=('doubletake-data-bin')
    groups=('pro-audio' 'lv2-plugins')
    install -Dm755 "$srcdir/DoubleTakeLinux/DoubleTake.lv2/DoubleTake.so" "$pkgdir/usr/lib/lv2/DoubleTake.lv2/DoubleTake.so"
    install -Dm644 "$srcdir/DoubleTakeLinux/DoubleTake.lv2/dsp.ttl" "$pkgdir/usr/lib/lv2/DoubleTake.lv2/dsp.ttl"
    install -Dm644 "$srcdir/DoubleTakeLinux/DoubleTake.lv2/manifest.ttl" "$pkgdir/usr/lib/lv2/DoubleTake.lv2/manifest.ttl"
    install -Dm644 "$srcdir/DoubleTakeLinux/DoubleTake.lv2/ui.ttl" "$pkgdir/usr/lib/lv2/DoubleTake.lv2/ui.ttl"
}

package_doubletake-vst3-bin() {
    ## Install VST3 Plugin
    pkgdesc="Vocal Take Processor Plugin (VST3)"
    depends=('doubletake-data-bin')
    groups=('pro-audio' 'vst3-plugins')
    install -Dm755 "$srcdir/DoubleTakeLinux/DoubleTake.vst3/Contents/Resources/moduleinfo.json" "$pkgdir/usr/lib/vst3/DoubleTake.vst3/Contents/Resources/moduleinfo.json"
    install -Dm755 "$srcdir/DoubleTakeLinux/DoubleTake.vst3/Contents/x86_64-linux/DoubleTake.so" "$pkgdir/usr/lib/vst3/DoubleTake.vst3/Contents/x86_64-linux/DoubleTake.so"
}
