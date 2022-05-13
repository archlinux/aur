pkgname=duality-ex-amp-bin
pkgver=20220513
pkgrel=2
pkgdesc="Audio Assault Duality Bass Studio Bass Amplifier Next Generation"
arch=('x86_64')
url="https://audioassault.mx/collections/plugins/products/duality-bass-studio"
license=('EULA')
groups=('pro-audio' 'vst-plugins' 'vst3-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
source=("Duality EX Bass Amp.desktop")
sha256sums=('525811ad46b800f3a6010bac3d89abd1057e7f19150a9dbb11a45cd8ce25d06c')

prepare () {
	## Extract Duality Bass Studio
	_archive="`xdg-user-dir DOWNLOAD`/DualityEX101.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name *.DS_Store -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/Duality EX" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    cp -rf "$srcdir/Duality EX Linux/Duality EX"/{IRs,MIDI,Presets} "$pkgdir/opt/Audio Assault/Duality EX"

    ## Install VST Plugin
    install -Dm755 "$srcdir/Duality EX Linux/Duality EX.so" "$pkgdir/usr/lib/vst/Duality EX.so"

    ## Install VST3 Plugin
    mkdir -p "$pkgdir/usr/lib/vst3"
    cp -rf "$srcdir/Duality EX Linux/Duality EX.vst3" "$pkgdir/usr/lib/vst3"

    ## Install Standalone Binary
    cp "$srcdir/Duality EX Linux/Duality EX Standalone" "$pkgdir/usr/bin/Duality EX Standalone"
    chmod +x "$pkgdir/usr/bin/Duality EX Standalone"
    install -Dm644 "$srcdir/Duality EX Bass Amp.desktop" "$pkgdir/usr/share/applications/Duality EX Bass Amp.desktop"
}
