# Maintainer: Denton Liu <liu.denton@gmail.com>
pkgname=crewlink
pkgver=2.0.1
pkgrel=1
pkgdesc='Free, open, Among Us Proximity Chat'
arch=('x86_64')
url='https://github.com/TheGreatMcPain/CrewLink'
license=('GPL3')
makedepends=('yarn')
optdepends=('sudo: crewlink-launcher support')
source=("https://github.com/TheGreatMcPain/CrewLink/archive/v$pkgver.tar.gz"
        crewlink-launcher)
sha256sums=('ba9e87301b386474ce6cab942e4afffcb7fb725e3ee5ce55a766d7146d00ffd6'
            '264849ad57fab753f9991399c39dbfb07e8996e0440b6f77d6e3470e38f71de6')

build() {
	cd "$srcdir/CrewLink-$pkgver"
	yarn install
	yarn dist-linux
}

package() {
	cd "$srcdir"

	mkdir -p "$pkgdir/opt"
	cp -r "CrewLink-$pkgver/dist/linux-unpacked" "$pkgdir/opt/CrewLink"

	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/CrewLink/crewlink "$pkgdir/usr/bin/crewlink"

	install -Dm 755 crewlink-launcher "$pkgdir/usr/bin/crewlink-launcher"
}
