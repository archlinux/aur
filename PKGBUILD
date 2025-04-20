pkgbase=bass-locker
pkgname=( ${pkgbase}-{data,standalone,lv2,vst3}-bin )
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
url="https://audioassault.mx/amplocker"
license=('EULA')
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'keyutils' 'krb5' 'libcurl-gnutls' 'libffi' 'libnghttp2' 'libidn2' 'libp11-kit' 'libpng' 'libpsl' 'libssh2' 'libtasn1' 'libunistring' 'libxau' 'libxcb' 'libx11' 'nettle' 'openssl' 'pcre2' 'zlib' 'zstd')
makedepends=('xdg-user-dirs')
provides=('amp-locker')
source=('Bass Locker.desktop'
        'Bass Locker Linker'
        'bass-locker.png'
        'https://audioassaultdownloads.s3.amazonaws.com/AmpLocker/AmpLocker109/BassLockerLinux.zip')
sha256sums=('72bb06f4b13a7c7e57cabb175972d788fee3940d60fe67507ee15366e4e0dc0f'
            'e6d6fced8469f9a1738824af3528eb9dc46af67b269d166d16a27fb4a2f6f120'
            '2ccb54d693ba09c2f86750891f2d1ea090f74fe282c3268617d1519b58f79ad5'
            '518ffa1da40b9f8c658d16cf8ab244f9fb31b55c10f64503286c517f7bb0319b')

package_bass-locker-data-bin() {
    ## Install Asset Data
    pkgdesc="Audio Assault Bass Multiamp Simulator (Data Assets)"
    groups=('pro-audio')

    ## Make data assets dir
    mkdir -p "$pkgdir/usr/lib/BassLockerData"

    ## Copy assets to data directory
    cp -r "$srcdir/BassLockerData/"* "$pkgdir/usr/lib/BassLockerData"

    ## Install Bass Locker Linker Script
    install -Dm755 "$srcdir/Bass Locker Linker" "$pkgdir/usr/bin/Bass Locker Linker"
}

package_bass-locker-lv2-bin() {
    ## Install LV2 Plugin
    pkgdesc="Audio Assault Bass Multiamp Simulator (LV2)"
    depends=('bass-locker-data-bin')
    groups=('pro-audio' 'lv2-plugins')
    install -Dm755 "$srcdir/Bass Locker.lv2/Bass Locker.so" "$pkgdir/usr/lib/lv2/Bass Locker.lv2/Bass Locker.so"
    install -Dm644 "$srcdir/Bass Locker.lv2/dsp.ttl" "$pkgdir/usr/lib/lv2/Bass Locker.lv2/dsp.ttl"
    install -Dm644 "$srcdir/Bass Locker.lv2/manifest.ttl" "$pkgdir/usr/lib/lv2/Bass Locker.lv2/manifest.ttl"
    install -Dm644 "$srcdir/Bass Locker.lv2/ui.ttl" "$pkgdir/usr/lib/lv2/Bass Locker.lv2/ui.ttl"
}

package_bass-locker-vst3-bin() {
    ## Install VST3 Plugin
    pkgdesc="Audio Assault Bass Multiamp Simulator (VST3)"
    depends=('bass-locker-data-bin')
    groups=('pro-audio' 'vst3-plugins')
    install -Dm755 "$srcdir/Bass Locker.vst3/Contents/x86_64-linux/Bass Locker.so" "$pkgdir/usr/lib/vst3/Bass Locker.vst3/Contents/x86_64-linux/Bass Locker.so"
}

package_bass-locker-standalone-bin() {
    ## Install Standalone Binary
    pkgdesc="Audio Assault Bass Multiamp Simulator (Standalone)"
    depends=('bass-locker-data-bin')
    groups=('pro-audio')
    install -Dm644 "$srcdir/Bass Locker.desktop" "$pkgdir/usr/share/applications/Bass Locker.desktop"
    install -Dm644 "$srcdir/bass-locker.png" "$pkgdir/usr/share/icons/hicolor/192x192/apps/bass-locker.png"
    install -Dm755 "$srcdir/Bass Locker Standalone" "$pkgdir/usr/bin/Bass Locker Standalone"
}
