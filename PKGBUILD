# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=firmware-manager-git
pkgver=r135.4211325
pkgrel=1
pkgdesc="Generic framework and GTK UI for firmware updates from fwupd, written in Rust."
arch=('x86_64')
url="https://github.com/pop-os/firmware-manager"
license=('GPL3')
depends=('dbus' 'gtk3' 'openssl')
makedepends=('git' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=('git+https://github.com/pop-os/firmware-manager.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make prefix=/usr features='fwupd'
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install prefix=/usr
}
