pkgname=ahm5050-amp-vst
pkgver=3.0.0
pkgrel=1
pkgdesc="Dual Amp Sim (VST Plugin)"
arch=('x86_64')
url="https://audioassault.mx/collections/plugins/products/ahm-5050"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## Extract AIR Impulse Response
	_archive="`xdg-user-dir DOWNLOAD`/AHMv3.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault/AHM5050"/{IRs,Presets}
    cp -rf $srcdir/AHM5050v3\ Linux/AHM5050/IRs/*.wav "$pkgdir/opt/Audio Assault/AHM5050/IRs"
    cp -rf $srcdir/AHM5050v3\ Linux/AHM5050/Presets/*.preset "$pkgdir/opt/Audio Assault/AHM5050/Presets/"

    ## Install VST Plugin
    install -Dm755 "$srcdir/AHM5050v3 Linux/AHM 5050 v3 vst2.so" "$pkgdir/usr/lib/vst/AHM 5050 v3 vst2.so"
}
