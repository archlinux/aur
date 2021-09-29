# Maintainer: fordprefect <fordprefect@dukun.de>
# Contributor: jhass <me@jhass.eu>
pkgname=luaunbound
pkgver=1.0.0
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
sha512sums=('9fab77481e7c84409d9ceb79156d06cb9ac2b2d7df53349e0f1b6c118022c9b1c22481e9413efedda41cc9acb1640d3d30cc4e0f9b7ed7fd6ed2511192a69d3c')

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
