# Maintainer: ChongChengAC <408173145@qq.com>
pkgname=extfstools-git
pkgver=r64.dc7c547
pkgrel=1
pkgdesc="Tools for extracting files from ext2,3,4 filesystem images"
arch=('any')
url="https://github.com/nlitsme/extfstools"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cmake')
source=("git+https://github.com/nlitsme/extfstools.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="/usr"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/licenses/$pkgname
	install build/ext2rd $pkgdir/usr/bin/
	install LICENSE $pkgdir/usr/share/licenses/$pkgname
}
