# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="libcoraza"
pkgver=1.8.0
pkgrel=1
pkgdesc="OWASP Coraza C connector"
arch=("x86_64" "aarch64")
url="https://github.com/corazawaf/libcoraza"
license=("Apache-2.0")
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f303f65d3bbd97e90aef5c26d2251949f4a8c7a4d8615a2d78c87455b0fa148c')

build(){
 cd "$pkgname-$pkgver"
 export CGO_CPPFLAGS="$CPPFLAGS"
 export CGO_CFLAGS="$CFLAGS"
 export CGO_CXXFLAGS="$CXXFLAGS"
 export CGO_LDFLAGS="$LDFLAGS"
 export GOFLAGS="-trimpath -mod=readonly -modcacherw"
 ./build.sh
 ./configure --prefix=/usr
 make
}

package(){
 cd "$pkgname-$pkgver"
 make DESTDIR="$pkgdir" install
}
