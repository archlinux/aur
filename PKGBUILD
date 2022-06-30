pkgname=blacksun-amp-bin
pkgver=2.0.0
pkgrel=3
pkgdesc="Audio Assault An Extremely Versatile Amp"
arch=('x86_64')
url="https://audioassault.mx/products/blacksun"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
source=("Blacksun Amp.desktop")
sha256sums=('59120cde3f90875b18db7e27761bb3eb95dd4d0e64eecd6729e6706269a8ce89')

prepare () {
    ## Extract Blacksun
	_archive="`xdg-user-dir DOWNLOAD`/Blacksun+Installers+v1.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/Blacksun" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    cp -rf "$srcdir/Blacksun Linux/Blacksun"/{IRs,Presets} "$pkgdir/opt/Audio Assault/Blacksun"
    cp -rf $srcdir/BStarA412\ FREE\ IR\ PACK "$pkgdir/opt/Audio Assault/Blacksun/IRs"

    ## Install VST Plugin
    install -Dm755 "$srcdir/Blacksun Linux/Blacksunvst2.so" "$pkgdir/usr/lib/vst/Blacksun.so"

    ## Install Standalone Binary
    cp "$srcdir/Blacksun Linux/Blacksun Standalone" "$pkgdir/usr/bin/Blacksun Standalone"
    chmod +x "$pkgdir/usr/bin/Blacksun Standalone"
    install -Dm644 "$srcdir/Blacksun Amp.desktop" "$pkgdir/usr/share/applications/Blacksun Amp.desktop"
}
