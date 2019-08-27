# Maintainer: Daniel Biehl dbiehl@live.de

pkgname=getgauge
pkgver=1.0.6
pkgrel=1
pkgdesc="Light weight cross-platform test automation tool for authoring test cases in the business language."
arch=('x86_64' 'i686')
url="https://getgauge.io"
license=('GPL3')
makedepends=('go')

source=("https://github.com/getgauge/gauge/archive/v$pkgver.tar.gz")
sha256sums=('89b47749ef134e57295849e89a10fadf577e05aeb690e9db013c39e9c59b1f5d')

_gourl="/github.com/getgauge/gauge"

prepare() {    
    cd "$srcdir"
    mkdir -p "src/github.com/getgauge/"
    mv "gauge-$pkgver" "src/github.com/getgauge/gauge"
}

build() {
    export GOPATH="${srcdir}"
    
    cd "${srcdir}/src/github.com/getgauge/gauge"
    
    go run build/make.go
}

package() {
    cd "${srcdir}/src/github.com/getgauge/gauge"

    go run build/make.go --install --prefix="$pkgdir/usr"
}

