# Maintainer: Vardan Tarayan <tarayanvardan@gmail.com>
pkgname='solarbg-git'
pkgrel=4
pkgver="v1.2.0.r0.gb4bd1bf"
pkgdesc="Sun altitude based wallpapers "
arch=('x86_64')
url="https://github.com/VardanHeroic/solarbg"
license=('GPL')
depends=('nodejs>=16.0.0')
makedepends=('git' 'npm')
optdepends=(
	'feh: x11 tiling wm support',
	'swaybg: wlroots based wayland compositors support')
source=('solarbg-git::git+https://github.com/VardanHeroic/solarbg.git')
md5sums=('SKIP')


pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	npm install --production
}

package() {
	cd "$pkgname"
	appdir=/usr/lib/${pkgname} 
	bindir=/usr/bin/

	install -d "${pkgdir}"${appdir}
	cp -r * "${pkgdir}"${appdir}

	install -d "${pkgdir}"${bindir}
	cp scripts/solarbg "${pkgdir}"${bindir} 

}
