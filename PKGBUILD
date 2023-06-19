pkgname="carapace"
pkgver=0.24.5
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
    ls cmd/ | xargs -I'{}' sh -c "cd ./cmd/{} && go build -v ."
}
check(){
    cd "${srcdir}/carapace-bin"
    go test -v ./cmd/...
}
package(){
    cd "${srcdir}/carapace-bin"
    install -Dm755 ./cmd/carapace/carapace \
        "${pkgdir}/usr/bin/carapace"
}
