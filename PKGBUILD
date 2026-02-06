# If you have a problem/question or want to improve this PKGBUILD,
# you can create an issue/pull request on this Github repository:
#
# https://github.com/siaeyy/PKGBUILDs
#
# You can still use the Arch website as well.
#

_pkgname=typomat
pkgname="$_pkgname"-git
pkgver=0.1.3.r0.g2baf227
pkgrel=1
pkgdesc="Turn your code into muscle memory"
arch=('any')
url="https://github.com/vupdivup/typomat"
license=('MIT')
depends=()
makedepends=('git' 'go>=1.25.4')
source=(git+"$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"

    git describe --tags --long | \
        sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd "$srcdir/$_pkgname"

    export GOBIN="$srcdir/gobin"
    export GOPATH="$srcdir/gopath"

    go install ./cmd/$_pkgname
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm755 "$srcdir/gobin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/_$pkgname/LICENSE"
}
