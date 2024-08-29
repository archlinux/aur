# Maintainer: Francisco Vilmar Cardoso Ruviaro <vilmar@debian.org>

pkgname=octoscan
pkgver=r86.69f0761
pkgrel=1
pkgdesc='Static vulnerability scanner for GitHub action workflows'
arch=('x86_64')
url="https://github.com/synacktiv/$pkgname"
license=('GPL-3.0')
makedepends=('git' 'go')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"

    #Build a Statically Linked Go Binary
    export CGO_ENABLED=0

    go build -o "$pkgname" .
}

package() {
    cd "$srcdir/$pkgname"
    install -D -m0755 -t "$pkgdir/usr/bin/" "$pkgname"
    install -D -m0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
