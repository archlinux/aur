pkgname=revc-git
pkgver=1.0+r870.a16fcd8d
pkgrel=1
pkgdesc="Grand Theft Auto: Vice City reverse engineered"
arch=(x86_64 aarch64)
url=https://github.com/td512/re3/tree/miami
license=(custom:none)
depends=(librw-git openal mpg123)
makedepends=(cmake)
install=revc.install
source=(
	git+https://github.com/td512/re3.git#branch=miami
	reVC.desktop)
md5sums=(
	SKIP
	a7cd29fced93db056a84486f166f1ecc)
pkgver(){
	cd re3
	git describe --tags|sed 's/.*_//;s/-\(.*\)-g/+r\1./'
}
build(){
	cd re3
	cmake -DREVC_VENDORED_LIBRW= .
	make
}
package(){
	cd re3
	install src/reVC -Dt "$pkgdir"/usr/bin
	install -D {res/images/logo,"$pkgdir"/usr/share/pixmaps/reVC}.svg
	install ../reVC.desktop -Dt "$pkgdir"/usr/share/applications
	cp -r gamefiles "$pkgdir"/usr/share/reVC
}
