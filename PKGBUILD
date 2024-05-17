pkgname=harrison-xt-plugins-bin
pkgver=10.0.0
pkgrel=1
pkgdesc="Harrison Consoles LV2 XT Plugin Suite"
arch=('x86_64')
url="https://harrisonconsoles.com/mixbus-plugins/"
license=('EULA')
groups=('lv2-plugins' 'pro-audio')
depends=('gcc-libs' 'glibc' 'libcurl-gnutls' 'libx11' 'libxau' 'libxcb' 'libxdmcp')
makedepends=('xdg-user-dirs')
source=("https://s3.eu-west-1.amazonaws.com/eu1.download.solidstatelogic.com/Harrison/Mixbus%2010/Mixbus-${pkgver}-${arch}.tar")
sha256sums=('3c86d432900f9d57b342da633649b66577032c6304ec3cd5c9dd28251c5ed422')

## Variables
_installer="Mixbus-${pkgver}-${arch}"
_app="Mixbus_${arch}-$pkgver"

package() {
	## Install LV2 Plugins
	mkdir -p "$pkgdir/usr/lib/lv2"

	## Extract Installer
	tar -xvf "$srcdir/`basename ${_installer}`.tar"
	sh "$srcdir/${_installer}.run" --tar xvf

	## Extract Bundle
	tar -xvf "$srcdir/`basename ${_app}`.tar"

	## Insstall LV2 Plugin
	cp -r "$srcdir/`basename ${_app}`/lib/LV2/Harrison.lv2" "$pkgdir/usr/lib/lv2/"
}
