# Maintainer: Denton Liu <liu.denton@gmail.com>
pkgname=crewlink
pkgver=1.2.1
pkgrel=2
pkgdesc='Free, open, Among Us Proximity Chat'
arch=('x86_64')
url='https://github.com/zbanks/CrewLink'
license=('GPL3')
makedepends=('yarn')
optdepends=('sudo: crewlink-launcher support')
source=("https://github.com/zbanks/CrewLink/archive/v$pkgver.tar.gz"
        crewlink-launcher)
sha256sums=('d3734df31d4e203f37f6fce0aeb2ab1303ee8b5435cd57ce56fd1362f6560cb6'
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
