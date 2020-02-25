# Maintainer: Tim Schneeberger (ThePBone) <tim.schneeberger(at)gmail.com>
pkgname=crunchyrolldl-git
pkgver=r25.5846c23
pkgrel=1
epoch=1
pkgdesc="Crunchyroll Downloader for Linux"
arch=('any')
url="https://github.com/ThePBone/CrunchyrollDownloader"
license=('GPL3')
depends=('qt5-base' 'mesa')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/ThePBone/CrunchyrollDownloader"
		"${pkgname%-git}.desktop")
sha256sums=('SKIP'
            '68e0077963131cb74f225dfc1cba291ebc25972330d99d1e63c00a2d592f31c6')

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
	install -Dm755 CrunchyrollDownloader "$pkgdir/usr/bin/CrunchyrollDownloader"
	install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
	#install -Dm644 img/icon.png "$pkgdir/usr/share/pixmaps/crunchyrolldl.png"
}
