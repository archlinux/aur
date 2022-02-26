pkgname=reamp-studio-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Audio Assault Reamp Studio Guitar Amplifier"
arch=('x86_64')
url="https://audio-assault.com/reampstudio.php"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
source=("Reamp Studio.desktop")
sha256sums=('5aacaa1d9663f95bb8c22de9a218e3a84a22c2c97daa819eadc7f4aae6bf94fb')

prepare () {
	## Extract Duality Bass Studio
	_archive="`xdg-user-dir DOWNLOAD`/ReAmp Studio v1.1b.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    cp -rf "$srcdir/ReAmp Studio v1.1b/Linux v1.1/ReAmp Studio Data" "$pkgdir/opt/Audio Assault/ReAmp Studio Data"

    ## Install VST Plugin
    install -Dm755 "$srcdir/ReAmp Studio v1.1b/Linux v1.1/ReAmp Studio.so" "$pkgdir/usr/lib/vst/ReAmp Studio.so"

    ## Install Standalone Binary
    cp "$srcdir/ReAmp Studio v1.1b/Linux v1.1/ReAmp Studio Standalone" "$pkgdir/usr/bin/ReAmp Studio Standalone"
    chmod +x "$pkgdir/usr/bin/ReAmp Studio Standalone"
    install -Dm644 "$srcdir/Reamp Studio.desktop" "$pkgdir/usr/share/applications/Reamp Studio.desktop"
}
