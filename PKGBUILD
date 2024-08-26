# Maintainer: Lennart Martens <monkeynator78@gmail.com>
pkgname=shuffle-ascii
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI command to print ASCII art with shuffle effect and color"
arch=('x86_64')
url="https://github.com/lennart1978/shuffle"
license=('MIT')
depends=('meson' 'ninja' 'gcc' 'glibc')
makedepends=('meson' 'ninja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('615b31fd06e395eba7f26b9c8849874ed71ed7f36c0124c2179e78b8c4064669')
build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir builddir
    meson setup builddir --buildtype=release --prefix=/usr/bin
    meson compile -C builddir
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    DESTDIR="$pkgdir" meson install -C builddir
}
