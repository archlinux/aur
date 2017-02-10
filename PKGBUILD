# Maintainer: Frantisek Fladung <ametisf@gmail.com>

_pkgname=dstatus
pkgname=$_pkgname-git
pkgver=17.8ceed88
pkgrel=1
pkgdesc="status bar for velox"
arch=('i686' 'x86_64')
url="https://github.com/ametisf/dstatus"
license=('MIT')
depends=('swc' 'velox')
makedepends=('tup')
optdepends=('terminus-font: bitmap font for nicer rendering')
source=("git+https://github.com/ametisf/dstatus.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
	cd $_pkgname
	echo "ENABLE_DEBUG=0" >> config.tup
	tup init
	tup upd
}

package() {
	mkdir -p $pkgdir/usr/bin
	install -m 755 $_pkgname/dstatus $pkgdir/usr/bin
}
