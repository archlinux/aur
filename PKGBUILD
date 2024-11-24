pkgbase=head-crusher
pkgname=('head-crusher-data-bin' 'head-crusher-lv2-bin' 'head-crusher-vst3-bin')
pkgver=1.0.2
pkgrel=1
arch=('x86_64')
url="https://audioassault.mx/plugin/Head_Crusher"
license=('EULA')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs' 'unzip')
provides=('head-crusher')
source=('Head Crusher Linker'
        'https://5db5public.s3.amazonaws.com/HeadCrusherLinux.zip')
sha256sums=('ecdcf0b394fabfd10058c41dc2993ac2c08c7916f0e2d1970620f4ff8d1c1046'
            '103bf1d707f7c7fd1ea36c641d997c701aa8785db21720b9519e7cba6f69b60b')

package_head-crusher-data-bin() {
    ## Install Asset Data
    pkgdesc="Saturator Plugin (Data Assets)"
    groups=('pro-audio')

    ## Make data assets dir
    mkdir -p "$pkgdir/usr/lib/5db5/Head Crusher/Presets"

    ## Copy assets to data directory
    cp -r "$srcdir/Presets/"* "$pkgdir/usr/lib/5db5/Head Crusher/Presets"

    ## Install Head Crusher Linker Script
    install -Dm755 "$srcdir/Head Crusher Linker" "$pkgdir/usr/bin/Head Crusher Linker"
}

package_head-crusher-lv2-bin() {
    ## Install LV2 Plugin
    pkgdesc="Saturator Plugin (LV2)"
    depends=('head-crusher-data-bin')
    groups=('pro-audio' 'lv2-plugins')
    install -Dm755 "$srcdir/Head Crusher.lv2/Head Crusher.so" "$pkgdir/usr/lib/lv2/Head Crusher.lv2/Head Crusher.so"
    install -Dm644 "$srcdir/Head Crusher.lv2/dsp.ttl" "$pkgdir/usr/lib/lv2/Head Crusher.lv2/dsp.ttl"
    install -Dm644 "$srcdir/Head Crusher.lv2/manifest.ttl" "$pkgdir/usr/lib/lv2/Head Crusher.lv2/manifest.ttl"
    install -Dm644 "$srcdir/Head Crusher.lv2/ui.ttl" "$pkgdir/usr/lib/lv2/Head Crusher.lv2/ui.ttl"
}

package_head-crusher-vst3-bin() {
    ## Install VST3 Plugin
    pkgdesc="Saturator Plugin (VST3)"
    depends=('head-crusher-data-bin')
    groups=('pro-audio' 'vst3-plugins')
    install -Dm755 "$srcdir/Head Crusher.vst3/Contents/Resources/moduleinfo.json" "$pkgdir/usr/lib/vst3/Head Crusher.vst3/Contents/Resources/moduleinfo.json"
    install -Dm755 "$srcdir/Head Crusher.vst3/Contents/x86_64-linux/Head Crusher.so" "$pkgdir/usr/lib/vst3/Head Crusher.vst3/Contents/x86_64-linux/Head Crusher.so"
}
