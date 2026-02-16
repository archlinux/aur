# Maintainer: fam007e <faisalmoshiur@gmail.com>
pkgname=libexecinfo
pkgver=1.1.0.19
pkgrel=1
pkgdesc="BSD-licensed clone of backtrace facility found in GNU libc"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/fam007e/libexecinfo"
license=('BSD')
depends=('glibc')
makedepends=('python')
provides=('libexecinfo.so')
conflicts=('libexecinfo-git')

# Use the GitHub release asset (latest) produced by CI.
source=("$pkgname-$pkgver.tar.gz::https://github.com/fam007e/libexecinfo/releases/latest/download/libexecinfo-$pkgver.tar.gz")
sha256sums=('4a44750572d27dcc1e8764cf9b6625d3231e8ac87000ae4c985e681fd1c96b68')

prepare() {
    cd "$srcdir"
    # The tarball structure might vary slightly depending on how it was packed,
    # but our workflow packs it as libexecinfo-<version>.
    # We simply cd into it in build().
    :
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr libdir=/usr/lib includedir=/usr/include all
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    make test
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install DESTDIR="$pkgdir" PREFIX=/usr libdir=/usr/lib includedir=/usr/include
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
