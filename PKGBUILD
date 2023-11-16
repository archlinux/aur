# Maintainer: DisableGraphics elchifladod@gmail.com
pkgbase="eslauncher2"
pkgname="eslauncher2"
pkgcompletename="ESLauncher2"
pkgrel=1
pkgver=0.9.2
pkgdesc="The next generation Endless Sky Launcher"
depends=('rust' 'alsa-lib')
arch=('any')
url="https://github.com/EndlessSkyCommunity/ESLauncher2"
license=('GPL-3.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('6b4446589eb82d7f2ba95674c4e2affeee6b99ed73263c24cf98912e2c9fbfb1c80c745a3c8087a839ba518600229e7672f908b2f5dd6bd929968e368388e7bd')

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


