# Maintainer: igo95862 at yandex dot ru
pkgname=bubblejail
pkgver=0.4.0
pkgrel=1
pkgdesc="Bubblewrap based sandboxing utility"
arch=('any')
url="https://github.com/igo95862/bubblejail"
license=('GPL3+')
depends=('python' 'python-xdg' 'bubblewrap' 'python-toml' 'xdg-dbus-proxy' 'hicolor-icon-theme' 'python-pyqt5' 'desktop-file-utils')
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
sha512sums=('29b9d2bb15f4c6d9ed8afd21e59ce5066a0096f51b01383b65b535f7fb8a89650572359d6a593912eee1863dbfec15f738e7fbfc28a6dfc72d7eb6aeb2db5055'
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
