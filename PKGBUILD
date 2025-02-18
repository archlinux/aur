# Maintainer: hexchain <arch at hexchain.org>

pkgname=libkrunfw
_pkgname=libkrunfw
_kver=6.12.3
pkgver=4.7.1
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

sha256sums=('e137f6bc7a78f2448bb06058284574cbdda55063f3d75fae501ae753e8ee0a87'
            'c89809cc777d50f1ea484a118630281a26383707a0e752c96fd834f6e765deae')
