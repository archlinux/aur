# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=terraform-ls
pkgver=0.38.8
pkgrel=1
pkgdesc='Terraform Language Server'
arch=('x86_64' 'aarch64')
url='https://github.com/hashicorp/terraform-ls'
license=('MPL-2.0')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1d2e725e49f08150ac4f9d3fab4961d56dde7f9f62922ce0ccdf93feb408c24c')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
    go build -ldflags "-compressdwarf=false -linkmode external -X main.rawVersion=$pkgver -X main.prerelease="
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}
