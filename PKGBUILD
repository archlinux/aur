# Maintainer: Joost Molenaar <jjm@j0057.nl>

pkgname=redumper
epoch=
pkgver=746
pkgrel=1
pkgdesc='Low level CD dumper utility'
arch=(x86_64)
url='https://github.com/superg/redumper'
license=('GPL-3.0-only')
depends=(
    libc++
    libc++abi
)
makedepends=(
    base-devel
    cmake
    ninja
    llvm
    clang
    lld
    git
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/superg/redumper/archive/refs/tags/b$pkgver.tar.gz"
)

build() {
    CC=clang CXX=clang++ LDFLAGS=-fuse-ld=lld cmake \
        -G Ninja \
        -S $pkgname-b$pkgver \
        -B $pkgname-dist \
        -DCMAKE_BUILD_TYPE=None \
        -DREDUMPER_VERSION_BUILD=$pkgver \
        -DREDUMPER_LINKER_FLAGS="" \
        ;
    ninja -C $pkgname-dist -v
}

package() {
    install -o root -g root -m 755 -d $pkgdir/usr/bin
    install -o root -g root -m 755 -t $pkgdir/usr/bin $pkgname-dist/redumper

    install -o root -g root -m 755 -d $pkgdir/usr/share/doc/redumper
    install -o root -g root -m 644 -t $pkgdir/usr/share/doc/redumper $pkgname-b$pkgver/README.md

    install -o root -g root -m 755 -d $pkgdir/usr/share/licenses/redumper
    install -o root -g root -m 644 -t $pkgdir/usr/share/licenses/redumper $pkgname-b$pkgver/LICENSE
}

sha256sums=('5b79ee560eb740d02e58375a274fb0ad2a206b1c6b05f7f9fad7890f80c322dd')
