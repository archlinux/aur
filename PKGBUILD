pkgname=harrison-xt-plugins-bin
pkgver=8.2.154
pkgrel=1
pkgdesc="Harrison Consoles LV2 XT Plugin Suite"
arch=('x86_64')
url="https://harrisonconsoles.com/mixbus-plugins/"
license=('EULA')
groups=('lv2-plugins' 'pro-audio')
depends=('glibc' 'libcurl-gnutls')
makedepends=('xdg-user-dirs' 'unzip')

## Variables
_archive="`xdg-user-dir DOWNLOAD`/Mixbus32C-${pkgver}-Linux-64bit-gcc5"
_installer="Mixbus32C-${pkgver}-x86_64-gcc5"
_app="Mixbus32C_x86_64-$pkgver"

prepare () {
	## Extract Harrison Plugins Archive
	ln -srf ${_archive}.tar "$srcdir/`basename ${_archive}`.tar"
	tar -xvf "$srcdir/`basename ${_archive}`.tar"
	sh "$srcdir/`basename ${_installer}`.run" --tar xvf
	tar -xvf "$srcdir/`basename ${_app}`.tar"
}

package() {
	## Install LV2 Plugins
	mkdir -p "$pkgdir/usr/lib/lv2"
	cp -r "$srcdir/`basename ${_app}`/lib/LV2/Harrison.lv2" "$pkgdir/usr/lib/lv2/"
}
