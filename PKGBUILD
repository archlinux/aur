# Maintainer: igo95862 at yandex dot ru
pkgname=bubblejail
pkgver=0.3.0
pkgrel=1
pkgdesc="Bubblewrap based sandboxing utility"
arch=('any')
url="https://github.com/igo95862/bubblejail"
license=('GPL3+')
depends=('python' 'python-xdg' 'bubblewrap' 'python-toml' 'xdg-dbus-proxy' 'hicolor-icon-theme')
conflicts=('bubblejail-git')
makedepends=('meson')
source=(
	"$url/releases/download/$pkgver/bubblejail-$pkgver.tar.gz"
	"$url/releases/download/$pkgver/bubblejail-$pkgver.tar.gz.sig"
	)
# To get the valid GPG key
# gpg --keyserver https://keys.mailvelope.com/ --search-keys 5A3D06576A6A67443DFBE856F1A55E62951B2143
validpgpkeys=('5A3D06576A6A67443DFBE856F1A55E62951B2143')
sha512sum=('141fcf1092513b6920d3c715b465de66a6ab7c6580105e0510cbf6a0229a305c66db2d980ab231bc11d73439890148ca08389287f76715e2467c8d885830a262'
	'SKIP')
md5sums=('5c1fd0f4ff19f1652ec6fcbc573509a4'
         'SKIP')

check () {
	meson test -C build --print-errorlogs
}

build () {
	arch-meson "$srcdir" build
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
