pkgname=classic-series-bin
pkgver=20220629
pkgrel=2
pkgdesc="Audio Assault 3 Original Classic Metal High-Gain Amp Designs"
arch=('x86_64')
url="https://audioassault.mx/products/classicseries"
license=('EULA')
groups=('pro-audio' 'vst-plugins' 'vst3-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
source=("Classic Series EX Amp.desktop")
sha256sums=('739bbdb7f6fd3c7f852cefb8399df34656691ef13934a9704ba0890731f386c7')

prepare () {
    ## Extract Classic Series EX
	_archive="`xdg-user-dir DOWNLOAD`/ClassicSeriesInstallers.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/Classic Series EX" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    cp -rf "$srcdir/Classic Series EX Linux/Classic Series EX"/{IRs,MIDI,Presets} "$pkgdir/opt/Audio Assault/Classic Series EX"

    ## Install VST Plugin
    install -Dm755 "$srcdir/Classic Series EX Linux/Classic Series EX vst2.so" "$pkgdir/usr/lib/vst/Classic Series EX.so"

    ## Install VST3 Plugin
    install -Dm755 "$srcdir/Classic Series EX Linux/Classic Series EX.vst3/Contents/x86_64-linux/Classic Series EX.so" "$pkgdir/usr/lib/vst3/Classic Series EX.vst3/Contents/x86_64-linux/Classic Series EX.so"

    ## Install Standalone Binary
    cp "$srcdir/Classic Series EX Linux/Classic Series EX Standalone" "$pkgdir/usr/bin/Classic Series EX Standalone"
    chmod +x "$pkgdir/usr/bin/Classic Series EX Standalone"
    install -Dm644 "$srcdir/Classic Series EX Amp.desktop" "$pkgdir/usr/share/applications/Classic Series EX Amp.desktop"
}
