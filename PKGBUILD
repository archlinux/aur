# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=vgrive
pkgver=1.2.4
pkgrel=1
pkgdesc="Google Drive client made in Vala"
arch=('x86_64')
url="https://github.com/bcedu/VGrive"
license=('GPL3')
depends=('gtk3' 'granite' 'json-glib' 'libsoup' 'libunity')
makedepends=('meson' 'vala' 'cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bcedu/VGrive/archive/$pkgver.tar.gz")
sha256sums=('f6aafd53fcb0830816a13f23cd5928377f4d7db01ccc269d451d0436d707bdad')

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
