# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-owncloud-music-git
pkgver=1.1.r0.geaf6a29
pkgrel=3
pkgdesc='OwnCloud Music integration for Nuvola Player.'
arch=('any')
url='https://github.com/tiliado/nuvola-app-owncloud-music'
license=('custom:BSD' 'CCPL')
depends=('nuvolaplayer-git')
makedepends=('git' 'lasem')
source=("$pkgname::git+https://github.com/tiliado/nuvola-app-owncloud-music.git"
        '0001-fix-icons.patch')
sha256sums=('SKIP'
            '969216351ef91d110970bbd24139aebb98bb29062af358f21fab9f1890c4208d')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname}"
	patch -p1 -i "${srcdir}/0001-fix-icons.patch"
}

package() {
	cd "${pkgname}"
	install -Dm644 LICENSE-BSD.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	make install DEST="${pkgdir}/usr/share/nuvolaplayer3/web_apps" SVG_CONVERT="lasem-render-0.4"
}
