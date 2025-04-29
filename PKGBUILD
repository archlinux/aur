pkgname=flatpak-go-mod
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI tool to generate Flatpak sources directives for Go modules"
arch=(x86_64)
url="https://github.com/dennwc/flatpak-go-mod"
license=("MIT")
depends=("go")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dennwc/flatpak-go-mod/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("fb5ee240b5d89d09f237cbd5cbc5f63f7dbdb332d75116a868378b62dd3984e1")

build() {
    cd "flatpak-go-mod-${pkgver}"
    go build -buildmode=pie -trimpath -mod=readonly -modcacherw
}

package() {
    cd "flatpak-go-mod-${pkgver}"
    install -Dm755 "flatpak-go-mod" -t "${pkgdir}/usr/bin"
    install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
