# Maintainer: Guillaume Hayot <ghayot@postblue.info>
# Contributor: Guillaume Hayot <ghayot@postblue.info>
pkgname=parlatype-libreoffice-extension
pkgver=2.0
pkgrel=2
pkgdesc="Parlatype LibreOffice Extension"
arch=('any')
url="https://github.com/gkarsay/parlatype-libreoffice-extension/"
license=('GPLv3')
depends=('libreoffice' 'parlatype=2.0')
makedepends=('meson' 'gettext' 'appstream' 'appstream-glib')
source=("https://github.com/gkarsay/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a91944b9c307e92a16b87475160c9496179f7bce036621988d3ec3fb81ce3d9a')

build() {
	cd "$pkgname-$pkgver"
	meson build --prefix=/usr -Dbundled=true
	cd build
	ninja
}

package() {
	cd "$pkgname-$pkgver"/build
	DESTDIR="$pkgdir/" ninja install
}
