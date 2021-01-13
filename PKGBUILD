# Maintainer: bbaovanc <bbaovanc@bbaovanc.com>

_pkgname=st
pkgname=$_pkgname-bbaovanc-git
pkgver=r1155.b2b31a8
pkgrel=1
pkgdesc="bbaovanc's fork of st (simple/suckless terminal)"
arch=(any)
url="https://github.com/BBaoVanC/$_pkgname"
license=('MIT')
depends=('libxft-bgra-git')
makedepends=('git' 'libxext')
provides=("$_pkgname")
conflicts=("$_pkgname")

source=("git+https://github.com/BBaoVanC/$_pkgname.git")
sha256sums=('SKIP')

_makeopts="--directory=$_pkgname"

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    make $_makeopts
}

package() {
    local installopts='--mode 0644 -D --target-directory'
    local shrdir="$pkgdir/usr/share"
    local licdir="$shrdir/licenses/$pkgname"
    local docdir="$shrdir/doc/$pkgname"
    make $_makeopts PREFIX=/usr DESTDIR="$pkgdir" install
    install $installopts "$licdir" "$_pkgname/LICENSE"
    install $installopts "$docdir" "$_pkgname/README.md"
    install $installopts "$shrdir/$pkgname" "$_pkgname/st.info"
}
