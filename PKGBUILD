# Maintainer: CallMeAlphabet
pkgname=fastcount-bin
pkgver=e06b228
pkgrel=1
pkgdesc="An incredibly fast, incredibly useless counter (x86_64 Linux only) — prebuilt binary from latest tested CI build"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fastcount"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('git')
provides=('fastcount')
conflicts=('fastcount')
source=("fastcount::https://github.com/CallMeAlphabet/fastcount/releases/download/latest/fastcount"
        "fastcount.sha256::https://github.com/CallMeAlphabet/fastcount/releases/download/latest/fastcount.sha256")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    git ls-remote "https://github.com/CallMeAlphabet/fastcount.git" refs/tags/latest | cut -c1-7
}

check() {
    cd "$srcdir"
    sha256sum -c "fastcount.sha256"
}

package() {
    cd "$srcdir"
    install -Dm755 "fastcount" "$pkgdir/usr/bin/fastcount"
}
