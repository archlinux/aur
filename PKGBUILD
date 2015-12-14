# Maintainer:  Xiaoxiao Pu <i@patme.net>

pkgname=sdlpal-git
pkgver=20140627
pkgrel=1
pkgdesc="A SDL-based reimplemention of the classic Chinese-language RPG 'Xian Jian Qi Xia Zhuan'"
arch=('i686' 'x86_64')
url="http://sdlpal.codeplex.com/"
license=('GPL')
depends=('sdl' 'xdg-utils')
makedepends=('git' 'imagemagick')
install="sdlpal.install"
source=("sdlpal::git+https://git01.codeplex.com/sdlpal"
        "sdlpal.sh"
        "sdlpal.desktop"
        "sdlpal.xpm")
sha256sums=('SKIP'
            '4f3b8446705af5decf25d00b54123875b9a79ae43cf70aa641c1028c29d2d547'
            '47bef648b2bb5da35912d9b5bd6b4e47f0767f125465068c7b96bb437b4fb6e3'
            '0467c0afb42c51d431f3964b6eca52ecb94fd4dd40a58d9a5d73d6c7c852cdb8')

build() {
	cd "${srcdir}/sdlpal/sdlpal"
	make
}

package() {
	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share/sdlpal"
	# install executable files
	install -Dm755 "sdlpal.sh" "${pkgdir}/usr/bin/sdlpal"
	install -Dm755 "${srcdir}/sdlpal/sdlpal/sdlpal" "${pkgdir}/usr/share/sdlpal/sdlpal"
	# install desktop file
	install -Dm644 "sdlpal.desktop" "${pkgdir}/usr/share/applications/sdlpal.desktop"
	# install icons
	for size in 16 22 24 32 48 64; do
		mkdir -p "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
		convert -resize "${size}" sdlpal.xpm "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/sdlpal.png"
	done
	install -Dm644 sdlpal.xpm "${pkgdir}/usr/share/icons/scalable/apps/sdlpal.xpm"
}