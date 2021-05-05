# Maintainer: Áron Ricardo Perez-Lopez <perez.aron@gmail.com>
pkgname=bluespec-contrib-git
pkgver=r3.ced0e9f
pkgrel=2
pkgdesc='Bluespec Compiler (BSC) - Contributed libraries and utilities'
arch=('any')
url='https://github.com/B-Lang-org/bsc-contrib'
license=('BSD')
depends=('bluespec-git')
makedepends=('git')
source=('git+https://github.com/B-Lang-org/bsc-contrib.git')
md5sums=('SKIP')

# Needs to be updated whenever bsc is updated.
eval pkgrel=$(pacman -Q bluespec-git | cut -d" " -f2 | cut -d"-" -f2)

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
