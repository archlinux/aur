# Maintainer: fordprefect <fordprefect@dukun.de>
# Contributor: jhass <me@jhass.eu>
pkgname=luaunbound
pkgver=0.5
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
source=("https://code.zash.se/dl/luaunbound/luaunbound-${pkgver}.tar.gz")
sha512sums=('8bd76a5e17d21b704953f5e2963b9ac0b4d3c6b32fd3dec8313ccea708a7606c6f6cdf088be6395e51bcaf4b2ca589e402dfb8bafdca53b6eda6088c0d6592b5')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    # use CC
    sed -i 's/(LD)/(CC)/g' GNUmakefile
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make all
}
 
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 lunbound.so "$pkgdir/usr/lib/prosody/util/lunbound.so"
    install -Dm644 README.markdown "$pkgdir/usr/share/doc/luaunbound/README"
    install -Dm444 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
