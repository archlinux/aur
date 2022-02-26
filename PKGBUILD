pkgname=headcrusher-amp-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Audio Assault Analog Modeled Saturator"
arch=('x86_64')
url="https://audioassault.mx/collections/plugins/products/headcrusher"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')
source=("Head Crusher Amp.desktop")
sha256sums=('893323a323a5ec22e8807970d6b08b2622eed7891c196f3123682fcc18634e95')

prepare () {
	## Extract AIR Impulse Response
	_archive="`xdg-user-dir DOWNLOAD`/HeadCrusherv2_u1_1.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/HeadCrusherv2" "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"
    cp -rf $srcdir/Head\ Crusher\ v2\ Linux/HeadCrusherv2/* "$pkgdir/opt/Audio Assault/HeadCrusherv2/"

    ## Install VST Plugin
    install -Dm755 "$srcdir/Head Crusher v2 Linux/Head Crusher v2.so" "$pkgdir/usr/lib/vst/Head Crusher v2.so"

    ## Install Standalone Binary
    cp "$srcdir/Head Crusher v2 Linux/Head Crusher v2 Jack" "$pkgdir/usr/bin/Head Crusher v2 Jack"
    chmod +x "$pkgdir/usr/bin/Head Crusher v2 Jack"
    install -Dm644 "$srcdir/Head Crusher Amp.desktop" "$pkgdir/usr/share/applications/Head Crusher Amp.desktop"
}
