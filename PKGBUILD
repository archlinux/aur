# old maintainer: Daniel Biehl dbiehl@live.de

pkgname=getgauge
pkgver=1.6.20
pkgrel=3
pkgdesc="Light weight cross-platform test automation tool for authoring test cases in the business language."
arch=('x86_64' 'i686')
url="https://getgauge.org"
license=('GPL3')
makedepends=('go')
binname="gauge"

source=("https://github.com/getgauge/gauge/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('049a15670d63fcefb2f8581d09cf249ddfe9ad9fef908c9f30959f60576d8cc4')

_gauge_path="github.com/getgauge/"

prepare() {
    cd $srcdir
    mkdir -p $_gauge_path
    mv $binname-$pkgver $srcdir/$_gauge_path
}

build() {
    export GOPATH="$srcdir"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-trimpath -modcacherw"

    cd "$srcdir/$_gauge_path/$binname-$pkgver"
    go run build/make.go build
}

package() {
    cd "$srcdir/$_gauge_path/$binname-$pkgver"
    go run build/make.go --install --prefix="$pkgdir/usr" install
}
