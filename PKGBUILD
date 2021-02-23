# Maintainer Alexander Mcmillan <linuxguy93@gmail.com>

pkgname=duality-bass-studio
pkgver=1.2.5	
pkgrel=2
pkgdesc="Duality Bass Studio Bass Amplifier (VST Plugin)."
arch=('x86_64')
url="https://audio-assault.com/duality.php"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')
source=("Duality Bass Studio.desktop")
md5sums=('1bc9374533fb107086be2304f02f44cf')

prepare () {
	## Extract Duality Bass Studio
	_archive="`xdg-user-dir DOWNLOAD`/Duality Bass Studio 1.2.51 Installer.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
}

package() {
    ## Install Standalone Application
    install -Dm755 "$srcdir/Linux $pkgver/Duality Bass Studio" "$pkgdir/usr/bin/Duality Bass Studio"
    
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault"
    cp -rf "$srcdir/Linux $pkgver/Duality" "$pkgdir/opt/Audio Assault/Duality"
    chmod -R 777 $pkgdir/opt/Audio\ Assault/Duality

    ## Install Desktop Launcher
    install -Dm644 "$srcdir/Duality Bass Studio.desktop" "$pkgdir/usr/share/applications/Duality Bass Studio.desktop"

    ## Install VST Plugin
    install -Dm755 "$srcdir/Linux $pkgver/Duality Bass Studio.so" "$pkgdir/usr/lib/vst/Duality Bass Studio.so"
}
