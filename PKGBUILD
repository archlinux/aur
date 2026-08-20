# Maintainer: CallMeAlphabet
pkgname=fastcount-bin
pkgver=0
pkgrel=1
pkgdesc="fastcount, an incredibly fast, incredibly useless counter, prebuilt binary"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fastcount"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('git' 'curl')
provides=('fastcount')
conflicts=('fastcount')
source=("fastcount::https://github.com/CallMeAlphabet/fastcount/releases/download/latest/fastcount"
        "fastcount.sha256::https://github.com/CallMeAlphabet/fastcount/releases/download/latest/fastcount.sha256")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    date -u -d "$(curl -s "https://api.github.com/repos/CallMeAlphabet/fastcount/commits/latest" | grep -m1 '"date"' | cut -d'"' -f4)" +%Y%m%d%H%M%S
}

check() {
    cd "$srcdir"
    sha256sum -c "fastcount.sha256"
}

package() {
    cd "$srcdir"
    install -Dm755 "fastcount" "$pkgdir/usr/bin/fastcount"
}
