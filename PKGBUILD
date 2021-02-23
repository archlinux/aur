# Maintainer Alexander Mcmillan <linuxguy93@gmail.com>

pkgname=rvxx-amp
pkgver=2.0.0
pkgrel=2
pkgdesc="RVXX Aggressive Guitar Amplifier (VST Plugin)."
arch=('x86_64')
url="https://audio-assault.com/rvxx.php"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')
source=("RVXX.desktop")
md5sums=('f75327e2917268d49b3d9be2414c7f96')

prepare () {
	## Extract AIR Impulse Response
	_archive="`xdg-user-dir DOWNLOAD`/RVXX v2 upd103.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
}

package() {
    ## Install Standalone Application
    install -Dm755 "$srcdir/RVXX v2/RVXX v2 Linux/RVXX v2 Standalone" "$pkgdir/usr/bin/RVXX v2 Standalone"
    
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault"
    cp -rf "$srcdir//RVXX v2/RVXX v2 Linux/RVXX" "$pkgdir/opt/Audio Assault/RVXX"
    chmod -R 777 $pkgdir/opt/Audio\ Assault/RVXX

    ## Install Desktop Launcher
    install -Dm644 "$srcdir/RVXX.desktop" "$pkgdir/usr/share/applications/RVXX.desktop"

    ## Install VST Plugin
    install -Dm755 "$srcdir//RVXX v2/RVXX v2 Linux/RVXX v2.so" "$pkgdir/usr/lib/vst/RVXX v2.so"
}
