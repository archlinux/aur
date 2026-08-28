# Maintainer: CallMeAlphabet
pkgname=fastannoy-bin
pkgver=15
pkgrel=1
pkgdesc="typos that are actually annoying, prebuilt binary"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fastannoy"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('git' 'curl')
provides=('fastannoy' 'gti' 'gerp' 'sudp' 'cst' 'vom')
conflicts=('fastannoy' 'gti' 'gerp' 'sudp' 'cst' 'vom')
source=("fastannoy::https://github.com/CallMeAlphabet/fastannoy/releases/download/latest/fastannoy-x86_64-linux-musl"
        "fastannoy.sha256::https://github.com/CallMeAlphabet/fastannoy/releases/download/latest/fastannoy-x86_64-linux-musl.sha256")
sha256sums=('049b0547456630862022829cf68b139d716069a84a9cd042f9dc3e9501b1653e'
            'f2e9e29df8876aa4028488a4915761dded9c3cf24774c4cc5f0b3639625ff052')

typos=('gti' 'gerp' 'sudp' 'cst' 'vom')

pkgver() {
    date -u -d "$(curl -s "https://api.github.com/repos/CallMeAlphabet/fastannoy/commits/latest" | grep -m1 '"date"' | cut -d'"' -f4)" +%Y%m%d%H%M%S
}

check() {
    cd "$srcdir"
    sha256sum -c <(sed "s/fastannoy-x86_64-linux-musl/fastannoy/" fastannoy.sha256)
}

package() {
    cd "$srcdir"
    install -Dm755 "fastannoy" "$pkgdir/usr/bin/fastannoy"
    for typo in "${typos[@]}"; do
        install -Dm755 "fastannoy" "$pkgdir/usr/bin/$typo"
    done
}
