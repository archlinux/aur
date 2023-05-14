# Maintainer: hexchain <arch at hexchain.org>

pkgname=libkrunfw
_pkgname=libkrunfw
_kver=6.2.14
pkgver=3.12.0
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

sha256sums=('ecdac7dfaaa97d20bd3e999fc9be8ceb672aa5307dcb636ddcfb6487f3da1b3b'
            '0ebc9fa309d496d474b06682578c5f7b42f0cf330365102b2feaab65ba296729')
