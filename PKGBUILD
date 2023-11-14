# Maintainer: DisableGraphics elchifladod@gmail.com
pkgbase="eslauncher2"
pkgname="eslauncher2"
pkgcompletename="ESLauncher2"
pkgrel=1
pkgver=0.9.0
pkgdesc="The next generation Endless Sky Launcher"
depends=('rust' 'alsa-lib')
arch=('any')
url="https://github.com/EndlessSkyCommunity/ESLauncher2"
license=('GPL-3.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('8a71ed9e7b5741428e486031b3a4efc00a1a8a28e61acddb3c443bbef8ecc5f76340ef4221904f5fc38ba980b079c1c79d148501d17dc830e253436b8cbeae02')

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


