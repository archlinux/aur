# Maintainer: W1ngD1nGa5ter <wangyiben0@outlook.com>
# Contributor: Orphaned (No active maintainer)
pkgname=fuck-u-code-git
pkgver=r18.b323d40
pkgrel=1
pkgdesc="一个专为挖掘项目"屎坑"设计的代码质量分析工具 (Git version)"
arch=('x86_64')
url="https://github.com/Done-0/fuck-u-code"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=('fuck-u-code')
conflicts=('fuck-u-code')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/fuck-u-code"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/fuck-u-code"
    mkdir -p build
}

build() {
    cd "$srcdir/fuck-u-code"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o build/fuck-u-code ./cmd/fuck-u-code
}

package() {
    cd "$srcdir/fuck-u-code"
    install -Dm755 build/fuck-u-code "$pkgdir/usr/bin/fuck-u-code"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
