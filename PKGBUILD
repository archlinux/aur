# Maintainer: Daniel Biehl dbiehl@live.de

pkgname=getgauge
pkgver=1.0.6
pkgrel=3
pkgdesc="Light weight cross-platform test automation tool for authoring test cases in the business language."
arch=('x86_64' 'i686')
url="https://getgauge.io"
license=('GPL3')
makedepends=('go')

source=("https://github.com/getgauge/gauge/archive/v$pkgver.tar.gz")
sha256sums=('89b47749ef134e57295849e89a10fadf577e05aeb690e9db013c39e9c59b1f5d')

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
