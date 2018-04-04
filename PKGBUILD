# Maintainer: Alad Wenter <alad@mailbox.org>
# Contributor: Uffe Jakobsen <uffe@uffe.org>
pkgname=hashdeep
pkgver=4.4
pkgrel=5
pkgdesc="cross-platform tools to message digests for any number of files"
arch=('x86_64')
url="https://github.com/jessek/hashdeep"
license=('GPL' 'custom')
depends=('gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jessek/hashdeep/archive/v$pkgver.tar.gz")
sha256sums=('ad78d42142f9a74fe8ec0c61bc78d6588a528cbb9aede9440f50b6ff477f3a7f')

prepare() {
    cd "$pkgname-$pkgver"
    ./bootstrap.sh
}

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

