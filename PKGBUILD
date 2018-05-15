# Maintainer: Daniel Biehl dbiehl@live.de

pkgname=getgauge
pkgver=0.9.9
pkgrel=1
pkgdesc="Light weight cross-platform test automation tool for authoring test cases in the business language."
arch=('x86_64' 'i686')
url="https://getgauge.io"
license=('GPL3')
makedepends=('go' "godep")

source=("https://github.com/getgauge/gauge/archive/v$pkgver.tar.gz")
sha256sums=('65f66ae5fa1522c5550fc47ae11ea459ac01666dea9e1a88e1b3c9aece5c9096')
_gourl="/github.com/getgauge/gauge"

prepare() {
    export GOPATH="${srcdir}"
    
    cd "$srcdir"
    mkdir -p "src/github.com/getgauge/"
    mv "gauge-$pkgver" "src/github.com/getgauge/gauge"
}

build() {    
    cd "${srcdir}/src/github.com/getgauge/gauge"

    godep restore
    go run build/make.go
}

package() {
    cd "${srcdir}/src/github.com/getgauge/gauge"

    go run build/make.go --install --prefix="$pkgdir/usr"
}

