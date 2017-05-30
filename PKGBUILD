# $Id$
# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>

pkgname=gerbera
pkgver=1.0.0
pkgrel=2
pkgdesc="UPnP Media Server"
arch=(i686 x86_64)
url="https://github.com/v00d00/gerbera"
license=('GPL2')
depends=('taglib' 'curl' 'sqlite' 'file' 'libmariadbclient' 'gcc-libs' 'pupnp>=1.8.0'
	 'duktape' 'libexif' 'expat')
source=("$pkgname-$pkgver.tar.gz::https://github.com/v00d00/gerbera/archive/v$pkgver.tar.gz")
sha256sums=('297c26e0b4223ea96cc6db403e2a2e8f81c51b64284535f3bc644abf24f66975')

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	mkdir -p "$pkgdir"/usr/lib/systemd
	cp -a scripts/systemd "$pkgdir"/usr/lib/systemd/system
}
