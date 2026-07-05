# Maintainer: Reyzer <reyzervt@gmail.com>
pkgname=nfx-git
pkgver=1.1.0
pkgrel=1
pkgdesc="NFX archive tool written in C using Zstandard, libzip and libarchive"
arch=('x86_64')
url='https://github.com/ReyzerMC/nfx'
license=('MIT')
provides=('nfx')
conflicts=('nfx')
depends=('zstd' 'libzip' 'libarchive')
makedepends=('gcc' 'make' 'git')
source=(https://github.com/ReyzerMC/nfx.git)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    make clean
    make
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 nfx "$pkgdir/usr/bin/nfx"

    if [ -f README.md ]; then
      install -Dm644 README.md "$pkgdir/usr/share/doc/nfx/README.md"
    fi
    if [ -f LICENSE ]; then
      install -Dm644 LICENSE "$pkgdir/usr/share/licenses/nfx/LICENSE"
    fi
}
