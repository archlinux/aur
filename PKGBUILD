pkgname=headcrusher-vst
pkgver=1.1.0
pkgrel=2
pkgdesc="Analog Modeled Saturator (VST Plugin)"
arch=('x86_64')
url="https://audioassault.mx/collections/plugins/products/headcrusher"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## Extract AIR Impulse Response
	_archive="`xdg-user-dir DOWNLOAD`/HeadCrusherv2_u1_1.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/HeadCrusherv2"
    cp -rf $srcdir/Head\ Crusher\ v2\ Linux/HeadCrusherv2/* "$pkgdir/opt/Audio Assault/HeadCrusherv2/"

    ## Install VST Plugin
    install -Dm755 "$srcdir/Head Crusher v2 Linux/Head Crusher v2.so" "$pkgdir/usr/lib/vst/Head Crusher v2.so"
}
