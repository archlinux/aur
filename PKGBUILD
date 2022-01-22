# Maintainer: igo95862 at yandex dot ru
pkgname=bubblejail
pkgver=0.4.4
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
makedepends=('meson' 'm4' 'python-sphinx')
source=(
	"$url/releases/download/$pkgver/bubblejail-$pkgver.tar.gz"
	"$url/releases/download/$pkgver/bubblejail-$pkgver.tar.gz.sig"
	)
# To get the valid GPG key
# gpg --keyserver https://keys.mailvelope.com/ --search-keys 5A3D06576A6A67443DFBE856F1A55E62951B2143
# Alternative if the above keyserver does not work
# curl -s 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x5a3d06576a6a67443dfbe856f1a55e62951b2143' | gpg --import
validpgpkeys=('5A3D06576A6A67443DFBE856F1A55E62951B2143')
sha512sums=('533599220567254bc4b5077dccdb81895f58c5d1e620bb2ed68a846c4679b989d36b5e0f8b35fd796c1d8ceeabd74c1091d27fd7448201b2c2c4c64fd2c31340'
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
