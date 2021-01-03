# Maintainer: Áron Ricardo Perez-Lopez <perez.aron@gmail.com>
pkgname=bluespec-contrib-git
pkgver=r3.ced0e9f
pkgrel=1
pkgdesc='Bluespec Compiler (BSC) - Contributed libraries and utilities'
arch=('any')
url='https://github.com/B-Lang-org/bsc-contrib'
license=('BSD')
depends=('bluespec-git')
makedepends=('git')
source=('git+https://github.com/B-Lang-org/bsc-contrib.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/bsc-contrib"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "$srcdir/bsc-contrib"
        make
}

package() {
	cd "$srcdir/bsc-contrib"
	install -d "${pkgdir}/opt/bluespec"
	cp -dr --preserve=mode,timestamp ./inst/* "${pkgdir}/opt/bluespec"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	cp -dr --preserve=mode,timestamp ./LICENSES/* "${pkgdir}/usr/share/licenses/${pkgname}"
}
