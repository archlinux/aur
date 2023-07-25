# Maintainer: DisableGraphics elchifladod@gmail.com
pkgbase="eslauncher2"
pkgname="eslauncher2"
pkgcompletename="ESLauncher2"
pkgrel=1
pkgver=0.8.12
pkgdesc="The next generation Endless Sky Launcher"
depends=('rust' 'alsa-lib')
arch=('any')
url="https://github.com/EndlessSkyCommunity/ESLauncher2"
license=('GPL-3.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('a4821cdd0955d0aed234be84c5ab0e55b914099fff78b46e0facccebd2dfbaccfa3552adb1487bb6bad0aec87728e92b24c50dcc56b9f9980056a649ebd4361b')

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


