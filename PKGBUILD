# Maintainer: Daniel Biehl dbiehl@live.de

pkgname=getgauge
pkgver=1.0.7
pkgrel=1
pkgdesc="Light weight cross-platform test automation tool for authoring test cases in the business language."
arch=('x86_64' 'i686')
url="https://getgauge.io"
license=('GPL3')
makedepends=('go')

source=("https://github.com/getgauge/gauge/archive/v$pkgver.tar.gz")
sha256sums=('017296636c857fa03aaf6a25d2497eb9456c44073225518365203f8f57a30260')

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
