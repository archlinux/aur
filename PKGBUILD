pkgname=shibalba-amp-bin
pkgver=20220330
pkgrel=1
pkgdesc="Audio Assault 2 Channel Boutique Amp Sim Next Generation"
arch=('x86_64')
url="https://audioassault.mx/products/shibalba"
license=('EULA')
groups=('pro-audio' 'vst-plugins' 'vst3-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
conflicts=("shibalba-ex-amp-bin")
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
    install -Dm755 "$srcdir/Shibalba EX Linux/Shibalba EX.vst3/Contents/x86_64-linux/Shibalba EX.so" "$pkgdir/usr/lib/vst3/Shibalba EX.vst3/Contents/x86_64-linux/Shibalba EX.so"

    ## Install Standalone Binary
    cp "$srcdir/Shibalba EX Linux/Shibalba EX Standalone" "$pkgdir/usr/bin/Shibalba EX Standalone"
    chmod +x "$pkgdir/usr/bin/Shibalba EX Standalone"
    install -Dm644 "$srcdir/Shibalba EX Amp.desktop" "$pkgdir/usr/share/applications/Shibalba EX Amp.desktop"
}
