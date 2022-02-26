pkgname=bulldog-amp-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Audio Assault Brute-Force Amp Sim"
arch=('x86_64')
url="https://audioassault.mx/collections/plugins/products/bulldog"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
source=("BULLDOG Amp.desktop")
sha256sums=('056e65d5b34650081b2b03ed412bf06274c2f116768333decae4d18259480d0b')

prepare () {
	## Extract AIR Impulse Response
	_archive="`xdg-user-dir DOWNLOAD`/BulldogRelease.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/Bulldog" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    cp -rf $srcdir/Bulldog\ Linux\ Install/Bulldog/* "$pkgdir/opt/Audio Assault/Bulldog/"

    ## Install VST Plugin
    install -Dm755 "$srcdir/Bulldog Linux Install/BULLDOGvst2.so" "$pkgdir/usr/lib/vst/BULLDOGvst2.so"

    ## Install Standalone Binary
    cp "$srcdir/Bulldog Linux Install/BULLDOG Standalone" "$pkgdir/usr/bin/BULLDOG Standalone"
    chmod +x "$pkgdir/usr/bin/BULLDOG Standalone"
    install -Dm644 "$srcdir/BULLDOG Amp.desktop" "$pkgdir/usr/share/applications/BULLDOG Amp.desktop"
}
