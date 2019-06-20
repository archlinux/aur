# Maintainer: Per Osbäck <per@osbeck.com>

pkgname=terraform-provider-cloudflare
pkgver=1.16.0
pkgrel=1
pkgdesc="Terraform provider for Cloudflare"
url="https://github.com/terraform-providers/terraform-provider-cloudflare"
arch=("x86_64")
license=("MPL")
makedepends=("go" "git")
_gourl="github.com/terraform-providers"
source=("https://github.com/terraform-providers/terraform-provider-cloudflare/archive/v$pkgver.tar.gz")
sha256sums=('72e3f37f71914fbedfc55814247af4f3d69aa12eaccba3b5b7e67dca0d0ded59')

prepare() {
    mkdir -p "$srcdir/src/$_gourl"
    rm -rf "${srcdir}/src/$_gourl/$pkgname"
    mv -f "$pkgname-$pkgver" "$srcdir/src/$_gourl/$pkgname"
    cd "$srcdir/src/$_gourl/$pkgname"
}

build() {
    cd "$srcdir/src/$_gourl/$pkgname"
    GOPATH="$srcdir" PATH="$srcdir/bin:$PATH" make build
}

package() {
    cd "$srcdir/bin"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
