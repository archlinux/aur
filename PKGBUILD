pkgname=air-impulse-loader
pkgver=1.0.2
pkgrel=1
pkgdesc="AIR Impulse Response Loader (VST Plugin)"
arch=('x86_64')
url="https://audio-assault.com/air.php"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## Extract AIR Impulse Response
	_archive="`xdg-user-dir DOWNLOAD`/aIR Impulse Loader 1.0.3a.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault"
    cp -rf "$srcdir/Linux $pkgver/aIR" "$pkgdir/opt/Audio Assault/aIR"
    chmod -R 777 $pkgdir/opt/Audio\ Assault/aIR

    ## Install VST Plugin
    install -Dm755 "$srcdir/Linux $pkgver/aIR Impulse Loader.so" "$pkgdir/usr/lib/vst/aIR Impulse Loader.so"
}
