# Maintainer: fanfly <fanfly at pm dot me>
pkgname=akochan
pkgver=r87.53188a0
pkgrel=1
pkgdesc="Artificial Intelligence for Japanese mahjong"
arch=('any')
url="https://github.com/critter-mj/akochan"
license=('custom')
depends=('boost')
makedepends=('git')
install=
changelog=
source=("git+https://github.com/critter-mj/akochan")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$pkgname"
	pushd ai_src
	make -f Makefile_Linux
	popd
	make -f Makefile_Linux
}

package() {
	install -dm755 "$pkgdir"/opt/"$pkgname"
	install -Dm755 "$srcdir"/"$pkgname"/system.exe "$pkgdir"/opt/"$pkgname"/
	cp -rp "$srcdir"/"$pkgname"/params -t "$pkgdir"/opt/"$pkgname"/

	install -d "$pkgdir"/usr/lib
	install -Dm755 "$srcdir"/"$pkgname"/libai.so "$pkgdir"/usr/lib/
}
