pkgname=duality-bass-studio-vst
pkgver=1.2.5
pkgrel=2
pkgdesc="Duality Bass Studio Bass Amplifier (VST Plugin)"
arch=('x86_64')
url="https://audio-assault.com/duality.php"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## Extract Duality Bass Studio
	_archive="`xdg-user-dir DOWNLOAD`/Duality Bass Studio 1.2.51 Installer.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name *.DS_Store -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault"
    cp -rf "$srcdir/Linux $pkgver/Duality" "$pkgdir/opt/Audio Assault/Duality"

    ## Install VST Plugin
    install -Dm755 "$srcdir/Linux $pkgver/Duality Bass Studio.so" "$pkgdir/usr/lib/vst/Duality Bass Studio.so"
}
