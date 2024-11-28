# Maintainer: Uģis Gērmanis <ugis@germanis.lv>
_name=ds360go
pkgname=${_name}-git
pkgver=r20.f5233db
pkgrel=1
pkgdesc="xboxdrv wrapper to use a Dualsense as a Xbox 360 controller on Linux "
arch=(any)
url="https://github.com/ugjka/ds360go"
license=('MIT')
depends=(xboxdrv)
makedepends=(go git)
provides=("${_name}")
install="${_name}".install
options=(!debug)
source=("${pkgname}::git+https://github.com/ugjka/ds360go.git#branch=main")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$pkgname"
	GOPATH="${srcdir}"/go make
}

package() {
	cd "$pkgname"
	DESTDIR="${pkgdir}/usr" PREFIX="/usr" make install
}
