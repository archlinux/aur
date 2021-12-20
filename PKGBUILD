pkgname=bulldog-vst
pkgver=1.0.0
pkgrel=2
pkgdesc="Brute-Force Amp Sim (VST Plugin)"
arch=('x86_64')
url="https://audioassault.mx/collections/plugins/products/bulldog"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## Extract AIR Impulse Response
	_archive="`xdg-user-dir DOWNLOAD`/BulldogRelease.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/Bulldog"
    cp -rf $srcdir/Bulldog\ Linux\ Install/Bulldog/* "$pkgdir/opt/Audio Assault/Bulldog/"

    ## Install VST Plugin
    install -Dm755 "$srcdir/Bulldog Linux Install/BULLDOGvst2.so" "$pkgdir/usr/lib/vst/BULLDOGvst2.so"
}
