# Maintainer: hexchain <arch at hexchain.org>

pkgname=libkrunfw
_pkgname=libkrunfw
_kver=6.12.20
pkgver=4.9.0
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

sha256sums=('c1781a0da17174751705ef857c9ecd3aa18c61ca8d3f1e4aacddf55761fd2400'
            '230e89b07b0ab82e74f07ecc1bee3105dca81d0ef4a97f900929c407249b6ac7')
