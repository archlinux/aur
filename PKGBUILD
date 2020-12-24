# Maintainer: Denton Liu <liu.denton@gmail.com>
pkgname=crewlink
pkgver=1.1.6
pkgrel=1
pkgdesc='Free, open, Among Us Proximity Chat'
arch=('x86_64')
url='https://github.com/zbanks/CrewLink'
license=('GPL3')
makedepends=('yarn')
source=("https://github.com/zbanks/CrewLink/archive/v$pkgver-linux.tar.gz"
        crewlink)
sha256sums=('df424481df5a473e9abfd1ca47bd6f2cc79ab275726757097574d26f46723f87'
            '80a5eb8b16ef5b92e164bc281cfd1bf5b7f9ff3996dd3122dae67f5356c97531')

build() {
	cd "$srcdir/CrewLink-$pkgver-linux"
	yarn install
	cp -r iohook/electron-v80-linux-x64 node_modules/iohook/builds
	yarn dist-linux
}

package() {
	cd "$srcdir"

	mkdir -p "$pkgdir/opt"
	cp -r "CrewLink-$pkgver-linux/dist/linux-unpacked" "$pkgdir/opt/CrewLink"
	install -Dm 755 crewlink "$pkgdir/usr/bin/crewlink"
}
