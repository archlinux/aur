pkgbase=vital-synth-bin
pkgname=("${pkgbase/-bin/}-standalone-bin" "${pkgbase/-bin/}-clap-bin" "${pkgbase/-bin/}-vst-bin" "${pkgbase/-bin/}-vst3-bin")
pkgver=1.5.5
pkgrel=3
arch=('x86_64')
url="https://vital.audio"
license=('custom')
provides=('vital-synth')
replaces=('vital-synth')
makedepends=("unzip")
depends=('alsa-lib' 'bzip2' 'brotli' 'freetype2' 'glibc' 'graphite' 'harfbuzz' 'krb5' 'libpng' 'libxau' 'libxext' 'libice' 'libsm' 'libxcb' 'libx11' 'pcre2' 'util-linux-libs' 'zlib')
source=('Vital Synth.desktop' 'vital-synth.png')
sha256sums=('821df7c83276bf54e0826e8059fa6417c959821e9e2b9b01d479079e1c4751a3'
            '905b2696b7ca634707629433f5d17d2f35b55594e3a63e4a767c17e3d7865f57')

prepare() {
	ln -srf "`xdg-user-dir DOWNLOAD`/VitalInstaller.zip" "${srcdir}/VitalInstaller.zip"
	unzip "${srcdir}/VitalInstaller.zip"
}

package_vital-synth-standalone-bin() {
    pkgdesc="Spectral warping wavetable synth (Standalone)"
    groups=('pro-audio')
    install -Dm755 "$srcdir/VitalInstaller/bin/Vital" "$pkgdir/usr/bin/Vital"
    install -Dm644 "$srcdir/vital-synth.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/vital-synth.png"
    install -Dm644 "$srcdir/Vital Synth.desktop" "$pkgdir/usr/share/applications/VitalInstaller/bin/Vital Synth.desktop"
}

package_vital-synth-clap-bin() {
    pkgdesc="Spectral warping wavetable synth (CLAP)"
    groups=('clap-plugins' 'pro-audio')
    install -Dm755 "$srcdir/VitalInstaller/lib/clap/Vital.clap" "$pkgdir/usr/lib/clap/Vital.clap"
}

package_vital-synth-vst-bin() {
    pkgdesc="Spectral warping wavetable synth (VST)"
    groups=('pro-audio' 'vst-plugins')
    install -Dm755 "$srcdir/VitalInstaller/lib/vst/Vital.so" "$pkgdir/usr/lib/vst/Vital.so"
}

package_vital-synth-vst3-bin() {
    pkgdesc="Spectral warping wavetable synth (VST)"
    groups=('pro-audio' 'vst3-plugins')
    install -Dm755 "$srcdir/VitalInstaller/lib/vst3/Vital.vst3/Contents/x86_64-linux/Vital.so" "$pkgdir/usr/lib/vst3/Vital.vst3/Contents/x86_64-linux/Vital.so"
}
