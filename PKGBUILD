pkgname=sigma-amp-vst
pkgver=2.0.0
pkgrel=1
pkgdesc="Modern High Gain Amp Simulator (VST Plugin)"
arch=('x86_64')
url="https://audioassault.mx/products/sigma"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## Extract Duality Bass Studio
	_archive="`xdg-user-dir DOWNLOAD`/Sigma+v2+Installers+Feb-27-2021.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/Sigma"
    cp -rf $srcdir/Sigma\ v2\ Linux/InstallerData/Sigma/{IRs,Presets} "$pkgdir/opt/Audio Assault/Sigma"

    ## Install VST Plugin
    install -Dm755 "$srcdir/Sigma v2 Linux/InstallerData/Sigma/Sigma v2.so" "$pkgdir/usr/lib/vst/Sigma v2.so"
}
