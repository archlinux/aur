# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Jordi De Groof <jordi.degroof@gmail.com>
# Contributor: Andre Klitzing <aklitzing@gmail.com>

pkgname=lcov
pkgver=1.13
pkgrel=3
pkgdesc="front-end for GCC's coverage testing tool gcov"
arch=('any')
url="https://github.com/linux-test-project/$pkgname"
license=('GPL')
depends=('perl')
source=("https://github.com/linux-test-project/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
        "handle-equals-signs.patch"
        "fix-undef-behaviour.patch")
sha256sums=('44972c878482cc06a05fe78eaa3645cbfcbad6634615c3309858b207965d8a23'
            '54728aa4e244d3662c65ba91fb486dc1d5c64d9d55745ee334c4131109dc233c'
            'ceaf41f7cc9cea5a6fc4b0385ffef10d1ab8812acd2a5b16dcd8d7bca7120488')

prepare () {
    cd "$pkgname-$pkgver"
    patch -p1 -i "$srcdir"/handle-equals-signs.patch
    patch -p1 -i "$srcdir"/fix-undef-behaviour.patch
}

package () {
    cd "$pkgname-$pkgver"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}
