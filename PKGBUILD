# Maintainer: Francisco Vilmar Cardoso Ruviaro <vilmar@debian.org>

pkgname=xva-img
pkgver=1.5
pkgrel=3
pkgdesc='Citrix XenServer .xva disk extraction tool'
arch=('x86_64')
url='https://github.com/eriklax/xva-img'
license=('GPL-2.0-with-OpenSSL-exception')
depends=('openssl' 'xxhash-git')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('89667ea86a5ec8cbf670966eea9d758f4571a92004c798d8df3e1aa0eaea9235')
sha512sums=('0d72c9e7f626c0c8f8d85e36c0810feef2448b68c144579b0dbc8983d6eadb4c1d887991d9bc05feb9be8814ea329737385a37404ee1a64797bec576843c394e')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i 's/\/usr\/local/\/usr/g' CMakeLists.txt
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake .
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m0755 -t "$pkgdir/usr/bin/" "$pkgname"
    install -D -m0644 -t "$pkgdir/usr/share/man/man1/" "$pkgname.1"
    install -D -m0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
