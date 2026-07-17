# Maintainer: CallMeAlphabet
pkgname=fastcp-bin
pkgver=cdb708a
pkgrel=1
pkgdesc="A fast cp wrapper using --reflink=always (x86_64 Linux only) — prebuilt binary from latest tested CI build"
arch=('x86_64')
url="https://github.com/CallMeAlphabet/fastcp"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('git')
provides=('fastcp')
conflicts=('fastcp')
source=("fastcp::https://github.com/CallMeAlphabet/fastcp/releases/download/latest/fastcp"
        "fastcp.sha256::https://github.com/CallMeAlphabet/fastcp/releases/download/latest/fastcp.sha256")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    git ls-remote "https://github.com/CallMeAlphabet/fastcp.git" refs/tags/latest | cut -c1-7
}

check() {
    cd "$srcdir"
    sha256sum -c "fastcp.sha256"
}

package() {
    cd "$srcdir"
    install -Dm755 "fastcp" "$pkgdir/usr/bin/fastcp"
}
