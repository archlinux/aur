# Maintainer: CallMeAlphabet
pkgname=fasthex-bin
pkgver=0
pkgrel=1
pkgdesc="fasthex, a very fast hex dumper, prebuilt binary"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fasthex"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('git' 'curl')
provides=('fasthex')
conflicts=('fasthex')
source=("fasthex::https://github.com/CallMeAlphabet/fasthex/releases/download/latest/fasthex"
        "fasthex.sha256::https://github.com/CallMeAlphabet/fasthex/releases/download/latest/fasthex.sha256")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    date -u -d "$(curl -s "https://api.github.com/repos/CallMeAlphabet/fasthex/commits/latest" | grep -m1 '"date"' | cut -d'"' -f4)" +%Y%m%d%H%M%S
}

check() {
    cd "$srcdir"
    sha256sum -c "fasthex.sha256"
}

package() {
    cd "$srcdir"
    install -Dm755 "fasthex" "$pkgdir/usr/bin/fasthex"
}
