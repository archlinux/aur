# Maintainer: Alwyn Kik <alwyn at kik dot pw>

pkgname=terraform-provider-gandi
pkgver=2.3.0
pkgrel=1
pkgdesc="Terraform provider for Gandi LiveDNS"
url="https://github.com/tiramiseb/terraform-provider-gandi"
license=("MPL")
arch=("x86_64")
makedepends=("go" "git")
_gourl="github.com/terraform-providers"
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('4155dfda35c3484d10ad38d0d00406812c6716fd00a2d5dc7e2a55d0c1e9f697')

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

