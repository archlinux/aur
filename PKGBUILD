# Maintainer: Avelino <t AT avelino DOT xxx>

pkgname=vim-bootstrap
pkgver=1.21.10
pkgrel=1
pkgdesc="Vim Bootstrap is generator provides a simple method of generating a .vimrc configuration for vim"
arch=('any')
url="https://github.com/editor-bootstrap/vim-bootstrap"
license=("MIT")
makedepends=("go")
provides=("editor-bootstrap")
source=(
    "https://github.com/editor-bootstrap/vim-bootstrap/archive/v${pkgver}.tar.gz"
)
sha256sums=("SKIP")

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -pv build/
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go mod download
    go build -o build/${pkgname} -ldflags="-s -w" ./cmd/vim-bootstrap/*.go
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dpm755 -D "build/${pkgname}" "${pkgdir}/usr/local/bin/${pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
