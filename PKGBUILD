# Maintainer: DisableGraphics elchifladod@gmail.com
pkgbase="eslauncher2"
pkgname="eslauncher2"
pkgcompletename="ESLauncher2"
pkgrel=1
pkgver=0.8.8
pkgdesc="The next generation Endless Sky Launcher"
depends=('rust' 'alsa-lib')
arch=('any')
url="https://github.com/EndlessSkyCommunity/ESLauncher2"
license=('GPL-3.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('00b0234ef69de362f1ad5b12ef28d1de270ce1cd24c0f4d1799be0fb8ca4ab9aa20c5366101240072d0b7fb11aff25ee01edb0404e285121f75deaec1ea41edc')

build() {
	cd ${pkgcompletename^}-${pkgver}
	cargo build --release
}

package() {
	install -Dm755 "${pkgcompletename^}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	for i in ${pkgcompletename^}-${pkgver}/packaging/icons/*.png; do
		export STR="${pkgcompletename^}-${pkgver}\/packaging\/icons\/${pkgname}_"
		export reswithpng="$(echo $i | sed -e s/${STR}//)";
		export res="$(echo ${reswithpng} | sed -e s/.png//)";
		install -Dm755 $i "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${pkgname}.png";
	done
	install -Dm755 "${pkgcompletename^}-${pkgver}/packaging/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}


