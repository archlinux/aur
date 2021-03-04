# Maintainer: Denton Liu <liu.denton@gmail.com>
pkgname=crewlink-bin
pkgver=2.0.1
pkgrel=1
pkgdesc='Free, open, Among Us Proximity Chat'
arch=('x86_64')
url='https://github.com/TheGreatMcPain/CrewLink'
license=('GPL3')
optdepends=('sudo: crewlink-launcher support')
provides=('crewlink')
conflicts=('crewlink')
source=("https://github.com/TheGreatMcPain/CrewLink/releases/download/v$pkgver/CrewLink-$pkgver.AppImage"
        crewlink-launcher)
sha256sums=('6531d6d1a1a14fdb7002a4b2356cff9a1250f930b09f0300adcda3d56af4063a'
            '264849ad57fab753f9991399c39dbfb07e8996e0440b6f77d6e3470e38f71de6')

package() {
	cd "$srcdir"

	chmod +x "CrewLink-$pkgver.AppImage"
	./"CrewLink-$pkgver.AppImage" --appimage-extract
	mkdir -p "$pkgdir/opt"
	cp -r squashfs-root "$pkgdir/opt/CrewLink"
	chmod go+rX -R "$pkgdir/opt/CrewLink"

	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/CrewLink/crewlink "$pkgdir/usr/bin/crewlink"

	install -Dm 755 crewlink-launcher "$pkgdir/usr/bin/crewlink-launcher"
}
