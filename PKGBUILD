# Maintainer: hacel <arch at sammar dot sa>
pkgname=jfsh
pkgver=0.1.16
pkgrel=1
pkgdesc="A terminal-based client for Jellyfin"
arch=("x86_64" "aarch64")
url="https://github.com/hacel/jfsh"
license=("Unlicense")
makedepends=("go>=1.23.1")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/hacel/jfsh/archive/v$pkgver.tar.gz")
sha256sums=('bee5bbb03b14635ca7001c071aa1e7269d727f765733e01379d07a65db45d32c')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    export GOPATH="$srcdir"/gopath
    export GOFLAGS="-trimpath -buildmode=pie -mod=readonly -modcacherw"
    export CGO_ENABLED=0
    LC_ALL=C _build_date="$(date)"
    go build -ldflags "-s -w -X 'main.version=${pkgver}' -X 'main.date=${_build_date}'" -o jfsh
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 jfsh "${pkgdir}/usr/bin/jfsh"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/jfsh/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/jfsh/README.md"
}
