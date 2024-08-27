# Maintainer: Francisco Vilmar Cardoso Ruviaro <vilmar@debian.org>

pkgname=tty-record
pkgver=0.1.0.r7.g2a020f5
pkgrel=1
pkgdesc='Simple tool to record a terminal session'
arch=('x86_64')
url="https://github.com/elisescu/$pkgname"
license=('MIT')
makedepends=('git' 'go' 'go-bindata')
source=("git+$url.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    go-bindata \
        -o bindata.go \
        asciinema-player.css \
        asciinema-player.min.js \
        templates/output_footer.html.in \
        templates/output_header.html.in
    go build \
        -mod vendor \
        -o "$pkgname" .
}

package() {
    cd "$srcdir/$pkgname"
    install -D -m0755 -t "$pkgdir/usr/bin/" "$pkgname"
    install -D -m0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
