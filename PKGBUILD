# Maintainer: CallMeAlphabet
pkgname=fastwc-bin
pkgver=0
pkgrel=1
pkgdesc="fastwc, a fast wc rewrite, prebuilt binary"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fastwc"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('git' 'curl')
provides=('fastwc')
conflicts=('fastwc')
source=("fastwc::https://github.com/CallMeAlphabet/fastwc/releases/download/latest/fastwc"
        "fastwc.sha256::https://github.com/CallMeAlphabet/fastwc/releases/download/latest/fastwc.sha256")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    date -u -d "$(curl -s "https://api.github.com/repos/CallMeAlphabet/fastwc/commits/latest" | grep -m1 '"date"' | cut -d'"' -f4)" +%Y%m%d%H%M%S
}

check() {
    cd "$srcdir"
    sha256sum -c "fastwc.sha256"
}

package() {
    cd "$srcdir"
    install -Dm755 "fastwc" "$pkgdir/usr/bin/fastwc"
}
