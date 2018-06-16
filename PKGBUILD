# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=terraform-provider-hcloud
pkgver=1.2.0
pkgrel=1
pkgdesc="Terraform provider for Hetzner Cloud"
url="https://github.com/terraform-providers/terraform-provider-hcloud"
arch=("x86_64")
license=("MPL")
makedepends=("go" "git")
_gourl="github.com/terraform-providers"
source=("https://github.com/terraform-providers/terraform-provider-hcloud/archive/v$pkgver.tar.gz")
sha256sums=('cf245e4616d66f56ba16cd03a5adcd2ed7d4ca87ec64cd7570593d85938abc76')


prepare() {
    mkdir -p "$srcdir/src/$_gourl"
    rm -rf "${srcdir}/src/$_gourl/$pkgname"
    mv -f "$pkgname-$pkgver" "$srcdir/src/$_gourl/$pkgname"
    msg2 "Fetching dependencies"
    cd "$srcdir/src/$_gourl/$pkgname"
}


build() {
    msg2 "Build program"
    cd "$srcdir/src/$_gourl/$pkgname"
    GOPATH="$srcdir" PATH="$srcdir/bin:$PATH" make build
}


package() {
    cd "$srcdir/bin"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
