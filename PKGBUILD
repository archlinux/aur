# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=terraform-provider-hcloud
pkgver=1.5.0
pkgrel=1
pkgdesc="Terraform provider for Hetzner Cloud"
url="https://github.com/terraform-providers/terraform-provider-hcloud"
arch=("x86_64")
license=("MPL")
makedepends=("go" "git")
_gourl="github.com/terraform-providers"
source=("https://github.com/terraform-providers/terraform-provider-hcloud/archive/v$pkgver.tar.gz")
sha256sums=('25afc721b54f02c44128aebcd8ab63dc347921efbb6d3d727c8b38912fc8ff98')


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
