# Maintainer: Per Osbäck <per@osbeck.com>

pkgname=terraform-provider-cloudflare
pkgver=1.15.0
pkgrel=1
pkgdesc="Terraform provider for Cloudflare"
url="https://github.com/terraform-providers/terraform-provider-cloudflare"
arch=("x86_64")
license=("MPL")
makedepends=("go" "git")
_gourl="github.com/terraform-providers"
source=("https://github.com/terraform-providers/terraform-provider-cloudflare/archive/v$pkgver.tar.gz")
sha256sums=('3308f0212fc5609b9bd2cf2cb5fcbd8b8f5a51481bd1a8f6da909ac9c4898d44')

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
