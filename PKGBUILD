# Maintainer: CallMeAlphabet
pkgname=timeit-bin
pkgver=0
pkgrel=1
pkgdesc="timeit, a precise command timing utility, prebuilt binary"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/timeit"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('git' 'curl')
provides=('timeit')
conflicts=('timeit')
source=("timeit::https://github.com/CallMeAlphabet/timeit/releases/download/latest/timeit"
        "timeit.sha256::https://github.com/CallMeAlphabet/timeit/releases/download/latest/timeit.sha256")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    date -u -d "$(curl -s "https://api.github.com/repos/CallMeAlphabet/timeit/commits/latest" | grep -m1 '"date"' | cut -d'"' -f4)" +%Y%m%d%H%M%S
}

check() {
    cd "$srcdir"
    sha256sum -c "timeit.sha256"
}

package() {
    cd "$srcdir"
    install -Dm755 "timeit" "$pkgdir/usr/bin/timeit"
}
