# Maintainer: alexcoder04 <alexcoder04@protonmail.com>
pkgname=golored
pkgver=1.0.0
pkgrel=3
pkgdesc="color shell scripts' output"
arch=('x86_64')
url="https://github.com/alexcoder04/golored"
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
sha256sums=('35fd91df89daabc8e66e7215904c2c06fde9fc552edab6d196421bef1c440182')

build(){
    cd "$pkgname-$pkgver"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    export GOOS="linux"
    export GOARCH="amd64"

    go build -ldflags "-X main.VERSION=$pkgver" -o "$pkgname" .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
