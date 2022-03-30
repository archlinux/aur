pkgname=shibalba-ex-amp-bin
pkgver=22.03.30
pkgrel=1
pkgdesc="Audio Assault 2 Channel Boutique Amp Sim Next Generation"
arch=('x86_64')
url="https://audioassault.mx/products/shibalba"
license=('EULA')
groups=('pro-audio' 'vst-plugins' 'vst3-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
source=("Shibalba EX Amp.desktop")
sha256sums=('b49c9c48300a0755f44df6885fe919048f95f701b6ae4af39bddc0661ff9c606')

prepare () {
	## Extract Duality Bass Studio
	_archive="`xdg-user-dir DOWNLOAD`/Shibalba_Ex_1_0.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	unzip "Shibalba_Ex_1_0.zip"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/Shibalba EX" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    cp -rf "$srcdir/Shibalba EX Linux/Shibalba EX"/{IRs,MIDI,Presets} "$pkgdir/opt/Audio Assault/Shibalba EX"

    ## Install VST Plugin
    install -Dm755 "$srcdir/Shibalba EX Linux/Shibalba EX VST2.so" "$pkgdir/usr/lib/vst/Shibalba EX.so"

    ## Install VST3 Plugin
    mkdir -p "$pkgdir/usr/lib/vst3"
    cp -r "$srcdir/Shibalba EX Linux/Shibalba EX.vst3" "$pkgdir/usr/lib/vst3/Shibalba EX.vst3"

    ## Install Standalone Binary
    cp "$srcdir/Shibalba EX Linux/Shibalba EX Standalone" "$pkgdir/usr/bin/Shibalba EX Standalone"
    chmod +x "$pkgdir/usr/bin/Shibalba EX Standalone"
    install -Dm644 "$srcdir/Shibalba EX Amp.desktop" "$pkgdir/usr/share/applications/Shibalba EX Amp.desktop"
}
