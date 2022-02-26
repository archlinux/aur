pkgname=sigma-amp-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Audio Assault Modern High Gain Amp Simulator"
arch=('x86_64')
url="https://audioassault.mx/products/sigma"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
source=("Sigma Amp.desktop")
sha256sums=('6f37b8041493b3063f435601aa2e930e8e74026cb69a7077f570d1ff3b065b17')

prepare () {
	## Extract Duality Bass Studio
	_archive="`xdg-user-dir DOWNLOAD`/Sigma+v2+Installers+Feb-27-2021.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/Sigma" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    cp -rf "$srcdir/Sigma v2 Linux/InstallerData/Sigma"/{IRs,Presets} "$pkgdir/opt/Audio Assault/Sigma"

    ## Install VST Plugin
    install -Dm755 "$srcdir/Sigma v2 Linux/InstallerData/Sigma/Sigma v2.so" "$pkgdir/usr/lib/vst/Sigma v2.so"

    ## Install Standalone Binary
    cp "$srcdir/Sigma v2 Linux/InstallerData/Sigma/Sigma v2 Standalone" "$pkgdir/usr/bin/Sigma v2 Standalone"
    chmod +x "$pkgdir/usr/bin/Sigma v2 Standalone"
    install -Dm644 "$srcdir/Sigma Amp.desktop" "$pkgdir/usr/share/applications/Sigma Amp.desktop"
}
