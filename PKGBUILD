pkgname=harrison-xt-lv2
pkgver=7.2.0
pkgrel=2
pkgdesc="Harrison Consoles LV2 XT Plugin Suite"
arch=('x86_64')
url="https://harrisonconsoles.com/mixbus-plugins/"
license=('EULA')
groups=('lv2-plugins' 'pro-audio')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')

## Variables
_archive="`xdg-user-dir DOWNLOAD`/Mixbus-${pkgver}-Linux-64bit-gcc5"
_installer="Mixbus-${pkgver}-x86_64-gcc5"
_app="Mixbus_x86_64-$pkgver"

prepare () {
	## Extract Harrison Plugins Archive
	ln -srf ${_archive}.tar "$srcdir/`basename ${_archive}`.tar"
	tar -xvf "$srcdir/`basename ${_archive}`.tar"
	sh "$srcdir/`basename ${_installer}`.run" --tar xvf
	tar -xvf "$srcdir/`basename ${_app}`.tar"
}

package() {
	## Install LV2 Plugins
	mkdir -p $pkgdir/usr/lib/lv2/
	cp -r "$srcdir/`basename ${_app}`/lib/LV2/Harrison.lv2" $pkgdir/usr/lib/lv2/
}
