# Maintainer: Alwyn Kik <alwyn at kik dot pw>

pkgname=terraform-provider-gandi
pkgver=2.0.0
pkgrel=1
pkgdesc="Terraform provider for Gandi LiveDNS"
url="https://github.com/tiramiseb/terraform-provider-gandi"
license=("MPL")
arch=("x86_64")
makedepends=("go" "git")
_gourl="github.com/terraform-providers"
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('2db68a5f917b1159991f89246231fcce6f0ec8b2a27f29702c29f110d43d2322')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
    go build -o terraform-provider-gandi
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}

