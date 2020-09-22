# Maintainer: Thorben Günther <echo YWRtaW5AeGVucm94Lm5ldAo= | base64 -d>

pkgname=terraform-ls
pkgver=0.7.0
pkgrel=1
pkgdesc='Terraform Language Server'
arch=('x86_64')
url='https://github.com/hashicorp/terraform-ls'
license=('custom:MPL2')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5b7721a2da6a9994373a0c5768bfc10ed7d21d2da1a53125f31b823fb36d2da3')

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}
