# Maintainer Alexander Mcmillan <linuxguy93@gmail.com>

pkgname=reamp-studio
pkgver=1.1	
pkgrel=2
pkgdesc="Reamp Studio Guitar Amplifier (VST Plugin)."
arch=('x86_64')
url="https://audio-assault.com/reampstudio.php"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')
source=("ReAmp Studio.desktop")
md5sums=('65a0f622f4de406162fe4c9f59ef508a')

prepare () {
	## Extract Duality Bass Studio
	_archive="`xdg-user-dir DOWNLOAD`/ReAmp Studio v1.1b.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
}

package() {
    ## Install Standalone Application
    install -Dm755 "$srcdir/ReAmp Studio v${pkgver}b/Linux v${pkgver}/ReAmp Studio Standalone" "$pkgdir/usr/bin/ReAmp Studio Standalone"
    
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault"
    cp -rf "$srcdir/ReAmp Studio v${pkgver}b/Linux v${pkgver}/ReAmp Studio Data" "$pkgdir/opt/Audio Assault/ReAmp Studio Data"
    chmod -R 777 $pkgdir/opt/Audio\ Assault/ReAmp\ Studio\ Data

    ## Install Desktop Launcher
    install -Dm644 "$srcdir/ReAmp Studio.desktop" "$pkgdir/usr/share/applications/ReAmp Studio.desktop"

    ## Install VST Plugin
    install -Dm755 "$srcdir/ReAmp Studio v${pkgver}b/Linux v${pkgver}/ReAmp Studio.so" "$pkgdir/usr/lib/vst/ReAmp Studio.so"
}
