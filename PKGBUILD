pkgname=crown-ex-amp-bin
pkgver=22.05.27
pkgrel=2
pkgdesc="Audio Assault Modern High Gain Amp Simulator Next Generation"
arch=('x86_64')
url="https://audioassault.mx/products/sigma"
license=('EULA')
groups=('pro-audio' 'vst-plugins' 'vst3-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
source=("Crown EX Amp.desktop")
sha256sums=('9ee179709bce7be2eab743547c78a8c3312a6fe5b72fa2beef498283fad05b2a')

prepare () {
	## Extract Duality Bass Studio
	_archive="`xdg-user-dir DOWNLOAD`/TheCrownEXv1_0_Installers.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/The Crown EX" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    cp -rf "$srcdir/The Crown EX Linux/The Crown EX"/{IRs,MIDI,Presets} "$pkgdir/opt/Audio Assault/The Crown EX"

    ## Install VST Plugin
    install -Dm755 "$srcdir/The Crown EX Linux/The Crown EX.so" "$pkgdir/usr/lib/vst/The Crown EX.so"

    ## Install VST3 Plugin
    mkdir -p "$pkgdir/usr/lib/vst3"
    cp -r "$srcdir/The Crown EX Linux/The Crown EX.vst3" "$pkgdir/usr/lib/vst3/The Crown EX.vst3"

    ## Install Standalone Binary
    cp "$srcdir/The Crown EX Linux/The Crown EX Standalone" "$pkgdir/usr/bin/The Crown EX Standalone"
    chmod +x "$pkgdir/usr/bin/The Crown EX Standalone"
    install -Dm644 "$srcdir/Crown EX Amp.desktop" "$pkgdir/usr/share/applications/Crown EX Amp.desktop"
}
