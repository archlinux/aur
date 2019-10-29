# Maintainer: ChacaS0 <incoming+chacas0-chksum-13830438-issue-@incoming.gitlab.com>
pkgname=chksum-git
pkgver=0.1
pkgrel=0.1
pkgdesc='Check and compare easily the checksum of a file.'
arch=('x86_64')
url="https://gitlab.com/ChacaS0/chksum"
license=('Apache')
provides=("chksum")
conflicts=("chksum")
makedepends=('git' 'go-pie')
source=("git+https://gitlab.com/chacas0/chksum#branch=master")
sha256sums=('SKIP')


pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "$srcdir/chksum"
    go build \
        -trimpath \
        -ldflags "-extldflags ${LDFLAGS}" \
        .
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
