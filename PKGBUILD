pkgname=reamp-studio
pkgver=1.1
pkgrel=1
pkgdesc="Reamp Studio Guitar Amplifier (VST Plugin)"
arch=('x86_64')
url="https://audio-assault.com/reampstudio.php"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## Extract Duality Bass Studio
	_archive="`xdg-user-dir DOWNLOAD`/ReAmp Studio v1.1b.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault"
    cp -rf "$srcdir/ReAmp Studio v${pkgver}b/Linux v${pkgver}/ReAmp Studio Data" "$pkgdir/opt/Audio Assault/ReAmp Studio Data"
    chmod -R 777 $pkgdir/opt/Audio\ Assault/ReAmp\ Studio\ Data

    ## Install VST Plugin
    install -Dm755 "$srcdir/ReAmp Studio v${pkgver}b/Linux v${pkgver}/ReAmp Studio.so" "$pkgdir/usr/lib/vst/ReAmp Studio.so"
}
