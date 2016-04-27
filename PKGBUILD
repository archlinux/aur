# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-owncloud-music-git
pkgver=1.1.r0.geaf6a29
pkgrel=1
pkgdesc="OwnCloud Music integration for Nuvola Player."
arch=("any")
url="https://github.com/tiliado/nuvola-app-owncloud-music"
license=('custom:BSD' 'CCPL')
depends=('nuvolaplayer-git')
makedepends=('git')
source=("$pkgname::git+https://github.com/tiliado/nuvola-app-owncloud-music.git")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $pkgname
	sed -i 's/$(APP_ID)\/$(SCALABLE_ICON)/nuvolaplayer3\/web_apps\/&/' Makefile
}


build() {
	cd $pkgname
	make build
}

package() {
	cd $pkgname
	install -vCDm644 LICENSE-BSD.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	make install DEST="${pkgdir}/usr/share/nuvolaplayer3/web_apps"
}
