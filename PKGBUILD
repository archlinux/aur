pkgname="carapace"
pkgver=0.28.5
pkgrel=1
pkgdesc="multi-shell multi-command argument completer"
arch=("x86_64")
url="https://rsteube.github.io/carapace-bin/"
license=("MIT")
makedepends=("go" "git")
source=(
    "git+https://github.com/rsteube/carapace-bin.git#tag=v${pkgver}"
)
sha256sums=(
    'SKIP'
)

build(){
    cd "${srcdir}/carapace-bin"
    go generate ./cmd/...
    go build -v -ldflags="-X main.version=v${pkgver}" ./cmd/carapace

}
check(){
    cd "${srcdir}/carapace-bin"
    go test -v ./cmd/...
}
package(){
    cd "${srcdir}/carapace-bin"
    install -Dm755 carapace \
        "${pkgdir}/usr/bin/carapace"
}
