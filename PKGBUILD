pkgname=kenbunshoku-haki
pkgver=1.1
pkgrel=1
pkgdesc="Monitor system"
arch=(x86_64)
url="https://github.com/Raissadev/monitor-system"
license=(GPL3)
makedepends=('go')
depends=('glibc')
source=("https://github.com/Raissadev/monitor-system/releases/download/v$pkgver/kenbunshoku-haki-$pkgver.tar.gz")
sha256sums=('4642d4fcbfcd9130bdec03a15da0253cd66b29418ca03ae988f0e942f7399f54')

prepare() {
    mkdir -p "$pkgname-$pkgver"
    cd "$pkgname-$pkgver"
}

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags='-X main.version=${pkgver} -X main.buildDate=$(date +%Y-%m-%d) -extldflags \"-static\"'"
    go build -o $pkgname ../../src
}

check() {
    cd "$pkgname-$pkgver"
    # Nenhum pacote para testar disponível
    # go test ./...
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

if [[ -z $maintainer ]]; then
  maintainer="Manutencao Ausente <raissa.geek@gmail.com>"
fi