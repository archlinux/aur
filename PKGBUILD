# Maintainer: EndlessEden < endlesseden [at] deep-rose {dot} org >
pkgname=plasma6-applet-homeassistant
pkgver=1.2.1
pkgrel=1
pkgdesc="Plasmoid for Home Assistant on your plasma desktop."
arch=('any')
url='https://github.com/korapp/plasma-homeassistant'
license=('GPL-3.0-or-later')

makedepends=('git')
depends=('libplasma>6' 'qt6-5compat' 'kirigami' 'ksvg' 'qt6-declarative' 'kdeclarative' 'kquickcharts' 'kcmutils' 'qt6-websockets' 'kwallet')
source=("git+https://github.com/korapp/plasma-homeassistant.git#tag=v${pkgver}"
		"secrets::git+https://github.com/korapp/plasma-lib-secrets.git")
sha256sums=('1975ab7f36a2556d562db844e4ff0797a4824c61d380e3dfccd4b1dcbe065e89'
			'SKIP')
prepare() {
	cd "${srcdir}"
	cp -r "secrets" "${srcdir}/plasma-homeassistant/package/contents/lib/"
	cd "${srcdir}/plasma-homeassistant/package/contents/lib/secrets/"
	rm -r .git .github
}

package() {
	mkdir -p "${pkgdir}/usr/share/plasma/plasmoids/com.github.korapp.homeassistant/"
	cp -rT "${srcdir}/plasma-homeassistant/package/" "${pkgdir}/usr/share/plasma/plasmoids/com.github.korapp.homeassistant/"
}
