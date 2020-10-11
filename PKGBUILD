# Maintainer: igo95862 at yandex dot ru
pkgname=bubblejail
pkgver=0.3.1
pkgrel=1
pkgdesc="Bubblewrap based sandboxing utility"
arch=('any')
url="https://github.com/igo95862/bubblejail"
license=('GPL3+')
depends=('python' 'python-xdg' 'bubblewrap' 'python-toml' 'xdg-dbus-proxy' 'hicolor-icon-theme' 'python-pyqt5')
conflicts=('bubblejail-git')
optdepends=(
	'bash-completion: completions for bash shell'
	'fish: completions for fish shell'
	)
makedepends=('meson')
source=(
	"$url/releases/download/$pkgver/bubblejail-$pkgver.tar.gz"
	"$url/releases/download/$pkgver/bubblejail-$pkgver.tar.gz.sig"
	)
# To get the valid GPG key
# gpg --keyserver https://keys.mailvelope.com/ --search-keys 5A3D06576A6A67443DFBE856F1A55E62951B2143
validpgpkeys=('5A3D06576A6A67443DFBE856F1A55E62951B2143')
sha512sums=('1056eaa39297819978674872165a9d70078900cf88bf338d6833ad80e1020ef3f04d676edf294f19e079ecd8701940c1f1a4de6396300ba54a04ddd245f85e78'
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
