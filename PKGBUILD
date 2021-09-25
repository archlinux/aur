pkgname=bulldog-vst
pkgver=0.9.9
pkgrel=1
pkgdesc="Brute-Force Amp Sim (VST Plugin)"
arch=('x86_64')
url="https://audioassault.mx/collections/plugins/products/bulldog"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## Extract AIR Impulse Response
	_archive="`xdg-user-dir DOWNLOAD`/Bulldog+Beta.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/Bulldog"
    cp -rf $srcdir/Bulldog\ Beta\ Linux/Bulldog/* "$pkgdir/opt/Audio Assault/Bulldog/"
    chmod -R 777 $pkgdir/opt/Audio\ Assault/Bulldog

    ## Install VST Plugin
    install -Dm755 "$srcdir/Bulldog Beta Linux/BULLDOGvst2.so" "$pkgdir/usr/lib/vst/BULLDOGvst2.so"
}
