# $Id$
# Maintainer: Nikolay Arhipov <nikolajs.arhipovs@gmail.com>

pkgname=terraform-provider-google
pkgver=0.1.3
pkgrel=1
pkgdesc="Terraform google provider"
url="http://www.terraform.io/"
arch=("i686" "x86_64")
license=("MPL")
makedepends=("go" "git")
_gourl="github.com/terraform-providers"
source=("https://github.com/terraform-providers/terraform-provider-google/archive/v$pkgver.tar.gz")
sha256sums=('b5ed4e2b758ae494b0a9e865439dfed7065ac8dc417058c8a766a5f2a48de2b8')


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
