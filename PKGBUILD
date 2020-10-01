# Maintainer: Daniel Biehl dbiehl@live.de

pkgname=getgauge
pkgver=1.1.4
pkgrel=1
pkgdesc="Light weight cross-platform test automation tool for authoring test cases in the business language."
arch=('x86_64' 'i686')
url="https://getgauge.io"
license=('GPL3')
makedepends=('go')

source=("https://github.com/getgauge/gauge/archive/v$pkgver.tar.gz")
sha256sums=('9250fde749c51b76acd375a82e27fbed758ff8982d9e6dc82c70e4dc218e6b4a')

_gauge_path="src/github.com/getgauge/gauge"

prepare() {
    cd "${srcdir}"
    mkdir -p "$(dirname ${_gauge_path})"
    mv "gauge-$pkgver" "${_gauge_path}"
}

build() {
    export GOPATH="${srcdir}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-trimpath"

    cd "${srcdir}/${_gauge_path}/"
    go run build/make.go
}

package() {
    cd "${srcdir}/${_gauge_path}"
    go run build/make.go --install --prefix="${pkgdir}/usr"
}
