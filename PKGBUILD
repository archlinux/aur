# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=clight-gui-git
pkgver=r38.8f44e71
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
            'b9b12a9a7a4f7377938418a01e7270ba73a2383a4a1d9b262571683fd74da6ab')

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
