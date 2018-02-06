# Maintainer: Matthew Treinish <mtreinish@kortar.org>

pkgname=terraform-provider-softlayer
pkgver=1.5.0
pkgrel=1
pkgdesc="Terraform softlayer provider"
url="https://github.com/softlayer/terraform-provider-softlayer"
arch=("i686" "x86_64")
license=("MPL2")
makedepends=("go" "git")
_gourl="github.com/softlayer/"
depends=('terraform')
source=("https://github.com/softlayer/terraform-provider-softlayer/archive/v$pkgver.tar.gz")
sha256sums=('812edd5381c4458a4fb38354cff03660f20fb918090905cc76cd601745724824')


prepare() {
    mkdir -p "$srcdir/src/$_gourl"
    rm -rf "${srcdir}/src/$_gourl/$pkgname"
    mv -f "$pkgname-$pkgver" "$srcdir/src/$_gourl/$pkgname"
    msg2 "Fetching dependencies"
    cd "$srcdir/src/$_gourl/$pkgname"
    GOPATH="$srcdir" go get -u github.com/hashicorp/terraform
}


build() {
    msg2 "Build program"
    cd "$srcdir/src/$_gourl/$pkgname"
    GOPATH="$srcdir" PATH="$srcdir/bin:$PATH" make bin
}


package() {
    cd "$srcdir/bin"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
