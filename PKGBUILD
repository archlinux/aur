# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

pkgname=libhildondesktop
pkgver=2.2.2
pkgrel=1
pkgdesc="Hildon Desktop Library"
url="https://github.com/maemo-leste/libhildondesktop"
arch=(any)
license=(GPL)
depends=(libhildon libiphb) 
makedepends=()
checkdepends=()
provides=($_pkgname)
conflicts=($_pkgname)
groups=(gnome)
source=("git+$url.git#tag=$pkgver"
        "stop-deprecated-functions-from-breaking-compilation.patch")
sha256sums=('SKIP'
            '63fe53fea2bfa0c787fb661f939f91fb364d8e826eb5e9ec36404c746888a1a4')

prepare() {
  cd $pkgname
  ls ..
  patch -p0 < ../stop-deprecated-functions-from-breaking-compilation.patch
 }

build() {
  cd $pkgname
  ./autogen.sh --prefix=/usr CFLAGS="${CFLAGS} -Wno-error=unused-but-set-variable"
  make
 }

package() {
  cd $pkgname
  make DESTDIR=$pkgdir install
}
