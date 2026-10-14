# Maintainer: Peter Blackman peter at pblackman dot plus dot com
pkgname=cbsg
# No proper version number from upstream
pkgver=master
pkgrel=1
pkgdesc='Corporate Bullshit Generator'
arch=('x86_64' 'aarch64' 'i686' 'armv7h')
url='https://github.com/zertovitch/cbsg'
license=('MIT')
depends=('glibc')
makedepends=('gcc-ada' 'gprbuild')
source=($pkgname-master.tar.gz)
sha256sums=('c855c58a006ef78f4c27fc4c3fbd91c41b2f8c8d9d260df86f4a87528efb97e9')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    gprbuild  -p -P delirium -largs -Wl,-z,relro,-z,now
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -v -Dm 755 produce_corporate_bullshit -T "$pkgdir/usr/bin/$pkgname"
    install -v -Dm 644 readme.md -t                  "$pkgdir/usr/share/doc/$pkgname"
}
