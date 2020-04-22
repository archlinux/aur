# Maintainer: hashworks <mail@hashworks.net>
# Contributor:  soloturn@gmail.com
# Contributor: nic96

pkgname=kiwix-desktop-git
pkgver=2.0.1.r0.gfc9e9a1
pkgrel=1
pkgdesc="Offline reader for Web content, especially intended to make Wikipedia available offline."
url="https://github.com/kiwix/kiwix-desktop"
arch=("i686" "x86_64")
license=("GPL3")
depends=("qt5-base" "qt5-webengine" "qt5-svg" "qt5-imageformats" "kiwix-lib")
makedepends=("qt5-tools")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake PREFIX="$pkdir/usr"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make INSTALL_ROOT="$pkgdir/" install
}

