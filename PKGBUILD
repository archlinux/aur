# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=luaunbound-hg
pkgver=r254+.8408810dde2e+
pkgrel=1
pkgdesc="drop-in replacement for Prosodys internal DNS library with a binding to libunbound"
url="https://www.zash.se/luaunbound.html"
arch=('i686' 'x86_64')
license=('custom:MIT')
depends=("unbound")
conflicts=("luaunbound")
provides=("luaunbound")
makedepends=("mercurial" "unbound" "lua")
optdepends=("luajit: jit for lua")
install=luaunbound.install
source=("${pkgname}::hg+https://code.zash.se/luaunbound")
sha512sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
    cd "$srcdir/$pkgname"
    sed -i 's/(LD)/(CC)/g' GNUmakefile
}

build() {
    cd "$srcdir/$pkgname"
    make all
}
 
package() {
    cd "$srcdir/$pkgname"
    install -Dm755 lunbound.so "$pkgdir/usr/lib/prosody/util/lunbound.so"
    install -Dm644 README.markdown "$pkgdir/usr/share/doc/luaunbound/README"
    install -Dm444 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
