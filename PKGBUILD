# Maintainer: DisableGraphics elchifladod@gmail.com
pkgbase="eslauncher2"
pkgname="eslauncher2"
pkgcompletename="ESLauncher2"
pkgrel=1
pkgver=0.8.10
pkgdesc="The next generation Endless Sky Launcher"
depends=('rust' 'alsa-lib')
arch=('any')
url="https://github.com/EndlessSkyCommunity/ESLauncher2"
license=('GPL-3.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('ccb2451a065a5d1657a099dc0fb5f66695ee2b673ffcc3ceebc7190021e631e767646c2c603a20d1f7e32b6ee1c39e7db248781a28e4a66e5213f334b8b69262')

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


