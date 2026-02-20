# Maintainer: Lazy Seldi <dex0aur@gmail.com>
pkgname=concord-git
pkgrel=1
pkgver=v3.0.0.r30.g2498dd2e
pkgdesc="A Discord API wrapper library made in C (dev branch)"
arch=('any')
url="https://github.com/Cogmasters/concord"
license=('MIT')
options=('!lto')
depends=('curl')
makedepends=('git')
source=("$pkgname"::git+https://github.com/Cogmasters/concord.git#branch=dev)
md5sums=(SKIP)

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    make shared
}

package() {
    cd "$srcdir/$pkgname"

    make PREFIX=/usr \
         DESTLIBDIR="$pkgdir/usr/lib" \
         DESTINCLUDE_DIR="$pkgdir/usr/include/concord" \
         PKGCONFIGDIR="$pkgdir/usr/lib/pkgconfig" \
         install

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
