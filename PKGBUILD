# $Id$
# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=terraform-provider-vcd
pkgver=2.5.0
pkgrel=1
pkgdesc="Terraform VMware vCloud Director provider"
url="https://github.com/terraform-providers/terraform-provider-vcd"
arch=("i686" "x86_64")
license=("MPL")
makedepends=("go" "git")
_gourl="github.com/terraform-providers"
source=("https://github.com/terraform-providers/terraform-provider-vcd/archive/v$pkgver.tar.gz")
sha256sums=('1f7c9639d19d8ec093f25283a2ad1fb4cdb1ac1206a82c5b63af7ddf1ec9e234')


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
