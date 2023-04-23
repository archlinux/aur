pkgname=revc-git
pkgver=1.0_r5087.a16fcd8d
pkgrel=1
pkgdesc="Grand Theft Auto: Vice City reverse engineered"
arch=(x86_64 aarch64)
url=https://github.com/halpz/re3/tree/miami
license=(custom:none)
depends=(librw-git openal mpg123)
makedepends=(cmake)
install=revc.install
source=(
	git+https://github.com/halpz/re3.git#branch=miami
	reVC.desktop)
md5sums=(
	SKIP
	a7cd29fced93db056a84486f166f1ecc)
pkgver(){
	cd re3
	echo 1.0_r`git rev-list --count HEAD`.`git rev-parse --short HEAD`
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
