# Maintainer: CallMeAlphabet
pkgname=fastcp-bin
pkgver=0
pkgrel=1
pkgdesc="fastcp, a fast cp wrapper using --reflink=always, prebuilt binary"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fastcp"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('git' 'curl')
provides=('fastcp')
conflicts=('fastcp')
source=("fastcp::https://github.com/CallMeAlphabet/fastcp/releases/download/latest/fastcp"
        "fastcp.sha256::https://github.com/CallMeAlphabet/fastcp/releases/download/latest/fastcp.sha256")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    date -u -d "$(curl -s "https://api.github.com/repos/CallMeAlphabet/fastcp/commits/latest" | grep -m1 '"date"' | cut -d'"' -f4)" +%Y%m%d%H%M%S
}

check() {
    cd "$srcdir"
    sha256sum -c "fastcp.sha256"
}

package() {
    cd "$srcdir"
    install -Dm755 "fastcp" "$pkgdir/usr/bin/fastcp"
}
