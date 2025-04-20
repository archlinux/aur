pkgbase=5db5-rm2
pkgname=( ${pkgbase}-{data,lv2,vst3}-bin )
pkgver=1.0.0
pkgrel=3
arch=('x86_64')
url="https://audioassault.mx/plugin/RM-2"
license=('EULA')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs')
provides=( ${pkgbase} )
source=('RM-2 Linker'
        'https://5db5public.s3.amazonaws.com/RM2Linux.zip')
sha256sums=('7ffdc44a6b69444c5b665d5b4280c7610d6f0172739893f56ca316536235c4c6'
            '8d1c58e8163579288ca88b290672c03f19500c760fb26c2c00df2a247b7ba399')

package_5db5-rm2-data-bin() {
    ## Install Asset Data
    pkgdesc="Analog Channel Emulator Plugin (Data Assets)"
    groups=('pro-audio')

    ## Make data assets dir
    mkdir -p "$pkgdir/usr/lib/5db5/RM-2/Presets"

    ## Copy assets to data directory
    cp -r "$srcdir/Presets/"* "$pkgdir/usr/lib/5db5/RM-2/Presets"

    ## Install RM-2 Linker Script
    install -Dm755 "$srcdir/RM-2 Linker" "$pkgdir/usr/bin/RM-2 Linker"
}

package_5db5-rm2-lv2-bin() {
    ## Install LV2 Plugin
    pkgdesc="Analog Channel Emulator Plugin (LV2)"
    depends=('5db5-rm2-data-bin')
    groups=('pro-audio' 'lv2-plugins')
    install -Dm755 "$srcdir/RM-2.lv2/RM-2.so" "$pkgdir/usr/lib/lv2/RM-2.lv2/RM-2.so"
    install -Dm644 "$srcdir/RM-2.lv2/dsp.ttl" "$pkgdir/usr/lib/lv2/RM-2.lv2/dsp.ttl"
    install -Dm644 "$srcdir/RM-2.lv2/manifest.ttl" "$pkgdir/usr/lib/lv2/RM-2.lv2/manifest.ttl"
    install -Dm644 "$srcdir/RM-2.lv2/ui.ttl" "$pkgdir/usr/lib/lv2/RM-2.lv2/ui.ttl"
}

package_5db5-rm2-vst3-bin() {
    ## Install VST3 Plugin
    pkgdesc="Analog Channel Emulator Plugin (VST3)"
    depends=('5db5-rm2-data-bin')
    groups=('pro-audio' 'vst3-plugins')
    install -Dm755 "$srcdir/RM-2.vst3/Contents/Resources/moduleinfo.json" "$pkgdir/usr/lib/vst3/RM-2.vst3/Contents/Resources/moduleinfo.json"
    install -Dm755 "$srcdir/RM-2.vst3/Contents/x86_64-linux/RM-2.so" "$pkgdir/usr/lib/vst3/RM-2.vst3/Contents/x86_64-linux/RM-2.so"
}
