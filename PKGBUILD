# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-owncloud-music-git
pkgver=1.1.r0.geaf6a29
pkgrel=2
pkgdesc='OwnCloud Music integration for Nuvola Player.'
arch=('any')
url='https://github.com/tiliado/nuvola-app-owncloud-music'
license=('custom:BSD' 'CCPL')
depends=('nuvolaplayer-git')
makedepends=('git' 'lasem')
source=("$pkgname::git+https://github.com/tiliado/nuvola-app-owncloud-music.git"
        '0001-icon-fixes.patch')
sha256sums=('SKIP'
            'b5f11c43fb03e476e1adba057b2c5aea91e3a5674fb13adfacd7ae6da338fc46')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname}"
	patch -p1 -i "${srcdir}/0001-icon-fixes.patch"
}

package() {
	cd "${pkgname}"
	install -Dm644 LICENSE-BSD.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	make install DEST="${pkgdir}/usr/share/nuvolaplayer3/web_apps" SVG_CONVERT="lasem-render-0.4"
}
