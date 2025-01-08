# Maintainer: hexchain <arch at hexchain.org>

pkgname=libkrunfw
_pkgname=libkrunfw
_kver=6.6.63
pkgver=4.5.1
pkgrel=1
pkgdesc="A dynamic library bundling the guest payload consumed by libkrun"
url="https://github.com/containers/libkrunfw"
arch=('x86_64')
license=('GPL-2.0-only' 'LGPL-2.1-only')
depends=('glibc')
makedepends=('bc' 'python-pyelftools')
source=(
    "https://github.com/containers/libkrunfw/archive/refs/tags/v$pkgver/$_pkgname-$pkgver.tar.gz"
    "https://cdn.kernel.org/pub/linux/kernel/v${_kver%%.*}.x/linux-${_kver}.tar.xz"
)
noextract=("linux-${_kver}.tar.xz")
options=(!debug)  # suppress empty debug package

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    mkdir tarballs
    cp -s "$srcdir/linux-${_kver}.tar.xz" tarballs/
    make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr LIBDIR_Linux=lib install
}

sha256sums=('2046d185e67ded54260e05dea9eea6f330f31a36f2859ccc26746bf67775d6d0'
            'd1054ab4803413efe2850f50f1a84349c091631ec50a1cf9e891d1b1f9061835')
