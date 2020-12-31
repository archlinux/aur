# Maintainer: Denton Liu <liu.denton@gmail.com>
pkgname=crewlink-bin
pkgver=1.2.1
pkgrel=1
pkgdesc='Free, open, Among Us Proximity Chat'
arch=('x86_64')
url='https://github.com/zbanks/CrewLink'
license=('GPL3')
optdepends=('sudo: crewlink-launcher support')
provides=('crewlink')
conflicts=('crewlink')
source=("https://github.com/zbanks/CrewLink/releases/download/v$pkgver/CrewLink-$pkgver.AppImage"
        crewlink-launcher)
sha256sums=('e0bc49f1762eca949482ff176f4c949614c5098cd9834b17550215dd4664eb8c'
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
