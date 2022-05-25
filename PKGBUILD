# Maintainer: alexcoder04 <alexcoder04@protonmail.com>
pkgname=kherson
pkgver=1.0.3
pkgrel=1
pkgdesc="Minimal status line generator for i3/sway written in Go"
arch=('x86_64')
url="https://github.com/alexcoder04/kherson"
license=('GPL3')
groups=()
depends=()
makedepends=(go)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/refs/tags/v$pkgver.tar.gz" "git+$url.wiki.git")
noextract=()
md5sums=('85118ffc3681983ea78cd1d8bf05657d' 'SKIP')

build(){
    cd "$pkgname-$pkgver"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GOOS="linux"
    export GOARCH="amd64"

    go build -o "$pkgname" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"

    cd "../$pkgname.wiki"
    install -Dm644 "Setting-Up.md" "$pkgdir/usr/share/doc/$pkgname/Setting-Up.md"
    install -Dm644 "Configuration.md" "$pkgdir/usr/share/doc/$pkgname/Configuration.md"
}
