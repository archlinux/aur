pkgname=duality-bass-studio-bin
pkgver=1.2.5
pkgrel=1
pkgdesc="Audio Assault Duality Bass Studio Bass Amplifier"
arch=('x86_64')
url="https://audio-assault.com/duality.php"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
source=("Duality Bass Studio Amp.desktop")
sha256sums=('47c30738d4794f9534f1d7a39f3338e607da53e61a1220664dd70456969ee949')

prepare () {
	## Extract Duality Bass Studio
	_archive="`xdg-user-dir DOWNLOAD`/Duality Bass Studio 1.2.51 Installer.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name *.DS_Store -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    cp -rf "$srcdir/Linux $pkgver/Duality" "$pkgdir/opt/Audio Assault/Duality"

    ## Install VST Plugin
    install -Dm755 "$srcdir/Linux $pkgver/Duality Bass Studio.so" "$pkgdir/usr/lib/vst/Duality Bass Studio.so"

    ## Install Standalone Binary
    cp "$srcdir/Linux $pkgver/Duality Bass Studio" "$pkgdir/usr/bin/Duality Bass Studio"
    chmod +x "$pkgdir/usr/bin/Duality Bass Studio"
    install -Dm644 "$srcdir/Duality Bass Studio Amp.desktop" "$pkgdir/usr/share/applications/Duality Bass Studio Amp.desktop"
}
