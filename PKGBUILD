pkgname=klank-vst
pkgver=1.0.0
pkgrel=2
pkgdesc="Bass Preamp (VST Plugin)"
arch=('x86_64')
url="https://audioassault.mx/collections/plugins/products/klank"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## Extract AIR Impulse Response
	_archive="`xdg-user-dir DOWNLOAD`/KLANKInstallers.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/KLANK"
    sh $srcdir/KLANKInstallerLinux.sh --tar xf
    cp -rf $srcdir/KLANK/{IRs,Presets} "$pkgdir/opt/Audio Assault/KLANK/"

    ## Install VST Plugin
    install -Dm755 "$srcdir/KLANK/KLANK.so" "$pkgdir/usr/lib/vst/KLANK.so"
}
