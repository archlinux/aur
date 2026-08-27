# Maintainer: CallMeAlphabet
pkgname=fastmc-bin
pkgver=0
pkgrel=1
pkgdesc="fastmc, create a Minecraft server in under a minute, prebuilt binary"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fastmc"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('git' 'curl')
provides=('fastmc')
conflicts=('fastmc')
source=("fastmc::https://github.com/CallMeAlphabet/fastmc/releases/download/latest/fastmc-x86_64-linux-musl"
        "fastmc.sha256::https://github.com/CallMeAlphabet/fastmc/releases/download/latest/fastmc-x86_64-linux-musl.sha256")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    date -u -d "$(curl -s "https://api.github.com/repos/CallMeAlphabet/fastmc/commits/latest" | grep -m1 '"date"' | cut -d'"' -f4)" +%Y%m%d%H%M%S
}

check() {
    cd "$srcdir"
    sha256sum -c <(sed "s/fastmc-x86_64-linux-musl/fastmc/" fastmc.sha256)
}

package() {
    cd "$srcdir"
    install -Dm755 "fastmc" "$pkgdir/usr/bin/fastmc"
}
