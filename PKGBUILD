# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=clight-gui-git
pkgver=r34.51e68b4
pkgrel=1
pkgdesc="Qt GUI for Clight"
arch=('x86_64')
url="https://github.com/nullobsi/clight-gui"
license=('GPL3')
depends=('clight-git' 'qt5-charts')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/nullobsi/clight-gui.git'
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            'f5fbdb9d0e537aa3a95f01bafcfe34ee4cc217a91a5ed59000cc26d1afab7dd8')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S "${pkgname%-git}/src" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	make -C build
}

package() {
	install -Dm755 "build/${pkgname%-git}" -t "$pkgdir/usr/bin"
	install -Dm644 "${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
}
