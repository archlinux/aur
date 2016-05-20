# Maintainer: Patrick Burroughs (Celti) <celti@celti.name>

pkgname=nuvola-app-google-play-git
pkgver=5.13.r0.gb2575e7
pkgrel=1
pkgdesc='Google Play Music integration for Nuvola Player.'
arch=('any')
url="https://github.com/tiliado/nuvola-app-google-play"
license=('custom:BSD')
depends=('nuvolaplayer-git')
makedepends=('git' 'lasem')
source=("${pkgname}::git+https://github.com/tiliado/nuvola-app-google-play.git"
        '0001-icon-fixes.patch')
sha256sums=('SKIP'
            '35ff6b557140aa9f2c7440bcf21ab528488adac134525e79336cbb93b6344bb7')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${pkgname}"
	patch -p1 -i "${srcdir}/0001-icon-fixes.patch"
}

package() {
	cd "${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	make install DEST="${pkgdir}/usr/share/nuvolaplayer3/web_apps" SVG_CONVERT="lasem-render-0.4"
}
