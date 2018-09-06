# Maintainer: fordprefect <fordprefect@dukun.de>
# Contributor: jhass <me@jhass.eu>
pkgname=luaunbound
pkgver=0.2_1
_pkgver=0.2-1
epoch=1
pkgrel=1
pkgdesc="drop-in replacement for Prosodys internal DNS library with a binding to libunbound"
url="https://www.zash.se/luaunbound.html"
arch=('i686' 'x86_64')
license=('custom:MIT')
depends=("unbound")
makedepends=("mercurial" "unbound" "lua" "libxslt" "ccache")
optdepends=("luajit: jit for lua")
install=luaunbound.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LuaDist2/luaunbound/archive/${_pkgver}.tar.gz" "use_cc.patch")
sha512sums=('SKIP'
            '6b11dfe9f5de743f101463fb3fb2144fe3aff75e7e19036f67d0e0b8adc8c36db73cf73d0aba483d651f8f5b2773093adc27e788354b165314c777e8de45bf28')

prepare() {
    cd "$srcdir/$pkgname-$_pkgver"
    patch -p1 < "$srcdir/use_cc.patch"
}

build() {
    cd "$srcdir/$pkgname-$_pkgver"
    make all
}
 
package() {
    cd "$srcdir/$pkgname-$_pkgver"
    install -Dm644 use_unbound.lua "$pkgdir/etc/prosody/use_unbound.lua"
    install -Dm755 lunbound.so "$pkgdir/usr/lib/prosody/util/lunbound.so"
    install -Dm644 README.markdown "$pkgdir/usr/share/doc/luaunbound/README"
    install -Dm444 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
