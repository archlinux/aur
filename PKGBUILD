# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=gccdiag
pkgver=0.2.7
pkgrel=2
pkgdesc="Utility to get GCC diagnostics for a file, with flags from compilation database."
arch=('i686' 'x86_64')
url="https://gitlab.com/andrejr/gccdiag"
makedepends=(
	'cmake'
	'boost'
    'taywee-args'
)
depends=(
    'boost-libs'
)
license=('GPL3')
provides=("gccdiag")
conflicts=("gccdiag-git")
source=("https://gitlab.com/api/v4/projects/28532726/packages/generic/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f2d8841eafcfa34a6eb52a2d34eccbf6cfd81174892622a068eaaaa29c6466fa')

build() {
    cmake \
        -B "${pkgname}-${pkgver}/build" \
        -S "${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    make -C "${pkgname}-${pkgver}/build"
}

package() {
    make -C "${pkgname}-${pkgver}/build" DESTDIR="$pkgdir" install
    install -D -m644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
