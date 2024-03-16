pkgname=harrison-xt-plugins-bin
pkgver=9.2.172
pkgrel=2
pkgdesc="Harrison Consoles LV2 XT Plugin Suite"
arch=('x86_64')
url="https://harrisonconsoles.com/mixbus-plugins/"
license=('EULA')
groups=('lv2-plugins' 'pro-audio')
depends=('glibc' 'libcurl-gnutls' 'libx11' 'libxau' 'libxcb' 'libxdmcp')
makedepends=('xdg-user-dirs')
source=("https://s3.eu-west-1.amazonaws.com/eu1.download.solidstatelogic.com/Harrison/Mixbus-${pkgver}-x86_64.run")
sha256sums=('cb6255b757f876477d60269ca3198097a36dfbac537f0e47b9c8f3c76c2acd78')

## Variables
_installer="Mixbus-${pkgver}-x86_64"
_app="Mixbus_x86_64-$pkgver"

package() {
	## Install LV2 Plugins
	mkdir -p "$pkgdir/usr/lib/lv2"
	## Extract Installer
	sh "$srcdir/`basename ${_installer}`.run" --tar xvf
	## Extract Bundle
	tar -xvf "$srcdir/`basename ${_app}`.tar"
	## Insstall LV2 Plugin
	cp -r "$srcdir/`basename ${_app}`/lib/LV2/Harrison.lv2" "$pkgdir/usr/lib/lv2/"
}
