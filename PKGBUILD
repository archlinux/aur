# Maintainer: Tim Schneeberger (ThePBone) <tim.schneeberger(at)gmail.com>
pkgname=ddctoolbox-git
pkgver=r106.e89da89
pkgrel=1
epoch=1
pkgdesc="DDC Toolbox for Linux"
arch=('any')
url="https://github.com/ThePBone/DDCToolbox"
license=('GPL3')
depends=('qt5-base' 'mesa')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/ThePBone/DDCToolbox"
		"${pkgname%-git}.desktop")
sha256sums=('SKIP'
            'd62019fb77f8cd40c7942453345f20e6479ba4ad22930ca2e138b1cddea9ed34')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake
	make PREFIX=/usr
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 DDCToolbox "$pkgdir/usr/bin/DDCToolbox"
	install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
	install -Dm644 img/icon.png "$pkgdir/usr/share/pixmaps/ddctoolbox.png"
}
