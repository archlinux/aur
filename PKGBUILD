# Maintainer: DisableGraphics elchifladod@gmail.com
pkgbase="eslauncher2"
pkgname="eslauncher2"
pkgcompletename="ESLauncher2"
pkgrel=1
pkgver=0.8.7
pkgdesc="The next generation Endless Sky Launcher"
depends=('rust')
arch=('any')
url="https://github.com/EndlessSkyCommunity/ESLauncher2"
license=('GPL-3.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('051eae777f554bbc74e30c2af6c53db7bf750c8e602625b564dbbd4f4e6930eaff244b6c1b3662004937be1defa61596b1750428bb2b82c598c60cf9011f7909')

build() {
	cd ${pkgcompletename^}-${pkgver}
	cargo build --release
}

package() {
	install -Dm755 ${pkgcompletename^}-${pkgver}/target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	for i in ${pkgcompletename^}-${pkgver}/packaging/icons/*.png; do
		export STR="${pkgcompletename^}-${pkgver}\/packaging\/icons\/${pkgname}_"
		export reswithpng="$(echo $i | sed -e s/${STR}//)";
		export res="$(echo ${reswithpng} | sed -e s/.png//)";
		install -Dm755 $i "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${pkgname}.png";
	done
	install -Dm755 ${pkgcompletename^}-${pkgver}/packaging/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}


