pkgname=hellbeast-vst
pkgver=2.0.0
pkgrel=2
pkgdesc="Hellish Brutal Amp Sim (VST Plugin)"
arch=('x86_64')
url="https://audioassault.mx/collections/plugins/products/hellbeast"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## Extract AIR Impulse Response
	_archive="`xdg-user-dir DOWNLOAD`/Hellbeast+v2+Installs.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/HellbeastV2"
    sh $srcdir/Hellbeast\ v2\ Installer\ Linux.sh --tar xf
    cp -rf $srcdir/HellbeastV2/{IRs,Presets} "$pkgdir/opt/Audio Assault/HellbeastV2/"

    ## Install VST Plugin
    install -Dm755 "$srcdir/HellbeastV2/Hellbeast v2.so" "$pkgdir/usr/lib/vst/Hellbeast v2.so"
}
