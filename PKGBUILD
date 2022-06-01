pkgname=air-impulse-loader-bin
pkgver=1.0.2
pkgrel=2
pkgdesc="Audio Assault AIR Impulse Response Loader"
arch=('x86_64')
url="https://audio-assault.com/air.php"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
source=("aIR Impulse Loader.desktop")
sha256sums=('c8a64689f395a5a1736ae26af81cca5d6d1400c6291e3417d635a2fd916ef589')

prepare () {
	## Extract AIR Impulse Response
	_archive="`xdg-user-dir DOWNLOAD`/aIR Impulse Loader 1.0.3a.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/aIR" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    cp -rf "$srcdir/Linux $pkgver/aIR"/{"Default IRs","IRlinks","aIR.settings"} "$pkgdir/opt/Audio Assault/aIR"

    ## Install VST Plugin
    install -Dm755 "$srcdir/Linux $pkgver/aIR Impulse Loader.so" "$pkgdir/usr/lib/vst/aIR Impulse Loader.so"

    ## Install Standalone Binary
    cp "$srcdir/Linux $pkgver/aIR Impulse Loader Standalone" "$pkgdir/usr/bin/aIR Impulse Loader Standalone"
    chmod +x "$pkgdir/usr/bin/aIR Impulse Loader Standalone"
    install -Dm644 "$srcdir/aIR Impulse Loader.desktop" "$pkgdir/usr/share/applications/aIR Impulse Loader.desktop"
}
