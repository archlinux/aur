# Maintainer: alexcoder04 <alexcoder04@protonmail.com>
pkgname=frei
pkgver=0.0.3
pkgrel=1
pkgdesc="A modern replacement for the 'free' command-line utility"
arch=('x86_64')
url="https://github.com/alexcoder04/frei"
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
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
md5sums=('b5fca253ad6bb7fadfb063e539a1075f')

build(){
    cd "$pkgname-$pkgver"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GOOS="linux"
    export GOARCH="amd64"

    go build \
        -ldflags "-X main.Version=$pkgver" \
        -o "$pkgname" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "screenshot.png" "$pkgdir/usr/share/doc/$pkgname/screenshot.png"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
