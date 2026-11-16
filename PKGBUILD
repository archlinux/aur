# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="libcoraza"
pkgver=1.8.1
pkgrel=1
pkgdesc="OWASP Coraza C connector"
arch=("x86_64" "aarch64")
url="https://github.com/corazawaf/libcoraza"
license=("Apache-2.0")
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2dd29dfeaff7d22452ef395fc47ec347305e4796b78b1c669a35ef5545014094')

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
