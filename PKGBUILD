# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=vgrive
pkgver=1.0.10
pkgrel=1
pkgdesc="Google Drive client made in Vala"
arch=('x86_64')
url="https://github.com/bcedu/VGrive"
license=('GPL3')
depends=('gtk3' 'granite' 'json-glib' 'libsoup' 'libunity')
makedepends=('meson' 'vala' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bcedu/VGrive/archive/$pkgver.tar.gz")
sha256sums=('8c8bd65c67f45e39f495d3abbe418998e304a04a5494fd685d4d07b0d7f3bcbb')

build() {
	cd "VGrive-$pkgver"
	meson build --prefix=/usr
	ninja -C build
}

package() {
	cd "VGrive-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
	ln -s /usr/bin/com.github.bcedu.vgrive "$pkgdir/usr/bin/$pkgname"
}
