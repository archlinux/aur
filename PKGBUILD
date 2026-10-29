# Maintainer: Vardan Tarayan <vardanheroic@gmail.com>
pkgname='solarbg-git'
pkgrel=1
pkgver=2.0.2.r0.g66965eb
pkgdesc="Sun altitude based wallpapers "
arch=('any')
url="https://github.com/VardanHeroic/solarbg"
license=('GPL-3.0-only')
depends=('nodejs>=17.1.0')
makedepends=('git' 'npm')
optdepends=(
	'feh: x11 tiling wm support',
	'swaybg: wlroots based wayland compositors support')
source=('solarbg-git::git+https://github.com/VardanHeroic/solarbg.git#branch=master')
md5sums=('SKIP')
replaces=('solarbg')


pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	npm install --include=dev
	npx tsc
}

package() {
	cd "$pkgname"
	
    local tarball
    tarball=$(npm pack --silent --pack-destination "$srcdir")

    npm install -g --prefix "$pkgdir/usr" "$srcdir/$tarball"

}
