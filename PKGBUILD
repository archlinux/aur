pkgname=rvxx-amp-vst
pkgver=2.0.0
pkgrel=2
pkgdesc="RVXX Aggressive Guitar Amplifier (VST Plugin)"
arch=('x86_64')
url="https://audio-assault.com/rvxx.php"
license=('EULA')
groups=('pro-audio' 'vst-plugins')
depends=('libcurl-gnutls' 'glibc')
makedepends=('xdg-user-dirs' 'unzip')

prepare () {
	## Extract AIR Impulse Response
	_archive="`xdg-user-dir DOWNLOAD`/RVXX+v2+Installers+Feb_26_2021.zip"
	ln -srf "${_archive}" "$srcdir/`basename "${_archive}"`"
	unzip "$srcdir/`basename "${_archive}"`"
	find $srcdir -name ".DS_Store" -delete
}

package() {
    ## Install Preset and Default Libraries
    mkdir -p "$pkgdir/opt/Audio Assault"
    mkdir -p "$pkgdir/opt/Audio Assault/RVXX/IRs"
    cp -rf $srcdir/RVXX\ v2\ Linux\ /InstallerData/RVXX/IRs/*.wav "$pkgdir/opt/Audio Assault/RVXX/IRs"
    mkdir -p "$pkgdir/opt/Audio Assault/RVXX/Presets"
    cp -rf $srcdir/RVXX\ v2\ Linux\ /InstallerData/RVXX/Presets/*.preset "$pkgdir/opt/Audio Assault/RVXX/Presets"

    ## Install VST Plugin
    install -Dm755 "$srcdir/RVXX v2 Linux /InstallerData/RVXX/RVXX v2.so" "$pkgdir/usr/lib/vst/RVXX v2.so"
}
