# Maintainer: Francisco Vilmar Cardoso Ruviaro <vilmar@debian.org>

pkgname=xva-img
pkgver=1.5
pkgrel=1
pkgdesc='Citrix XenServer .xva disk extraction tool'
arch=('x86_64')
url='https://github.com/eriklax/xva-img'
license=('GPL-2.0-with-OpenSSL-exception')
makedepends=('cmake' 'openssl' 'xxhash-git')
source=("$url/archive/refs/tags/$pkgver.tar.gz"
        'Fix-CMakeLists.txt.patch')
sha256sums=('89667ea86a5ec8cbf670966eea9d758f4571a92004c798d8df3e1aa0eaea9235'
            '483200046bff345712b7247b7f90758397839eb4833635fd48bfb714e191352b')
prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np1 -i "$srcdir/Fix-CMakeLists.txt.patch"
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
