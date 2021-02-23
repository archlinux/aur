# Maintainer Alexander Mcmillan <linuxguy93@gmail.com>

pkgname=air-impulse-loader
pkgver=1.0.2
pkgrel=2
pkgdesc="AIR Impulse Response Loader (VST Plugin)."
arch=('x86_64')
url="https://audio-assault.com/air.php"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')
source=("AIR Impulse Loader.desktop")
md5sums=('d07c3b4ce6b585e0cdb59a4dce50545c')

prepare () {
	## Extract AIR Impulse Response
	_archive="`xdg-user-dir DOWNLOAD`/aIR Impulse Loader 1.0.3a.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
}

package() {
    ## Install Standalone Application
    install -Dm755 "$srcdir/Linux $pkgver/aIR Impulse Loader Standalone" "$pkgdir/usr/bin/aIR Impulse Loader Standalone"
    
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault"
    cp -rf "$srcdir/Linux $pkgver/aIR" "$pkgdir/opt/Audio Assault/aIR"
    chmod -R 777 $pkgdir/opt/Audio\ Assault/aIR

    ## Install Desktop Launcher
    install -Dm644 "$srcdir/AIR Impulse Loader.desktop" "$pkgdir/usr/share/applications/AIR Impulse Loader.desktop"

    ## Install VST Plugin
    install -Dm755 "$srcdir/Linux $pkgver/aIR Impulse Loader.so" "$pkgdir/usr/lib/vst/aIR Impulse Loader.so"
}
