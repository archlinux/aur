# Maintainer: hexchain <arch at hexchain.org>

pkgname=libkrunfw
_pkgname=libkrunfw
_kver=6.6.52
pkgver=4.4.2
pkgrel=1
pkgdesc="A dynamic library bundling the guest payload consumed by libkrun"
url="https://github.com/containers/libkrunfw"
arch=('x86_64')
license=('GPL2')
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

sha256sums=('26a348bcb0a43a56ee98d67178a78fa6c9b6378a64532b2ad0bc9fe1f4cc3297'
            '1591ab348399d4aa53121158525056a69c8cf0fe0e90935b0095e9a58e37b4b8')
