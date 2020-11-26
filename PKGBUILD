# Maintainer: Jens Carl <jc [dot] archlinux [at] jens-carl [dot] de>

pkgname=evisum
pkgver=0.5.8
pkgrel=1
pkgdesc="EFL Process Viewer"
arch=('x86_64')
url="https://www.enlightenment.org"
license=('ISC')
depends=('efl')
makedepends=('meson' 'ninja')
source=("https://download.enlightenment.org/rel/apps/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('5d0661aae7f065c4f84325c66ddbfa7ef8242e2885eeccc74c0826031adee431')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
    if [ -d build ]; then
        rm -rf build
    fi
	meson --prefix=/usr build
    ninja -C build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="$pkgdir" ninja -C build install

    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
