# Maintainer: Jens Carl <jc [dot] archlinux [at] jens-carl [dot] de>

pkgname=evisum
pkgver=0.5.0
pkgrel=1
pkgdesc="EFL Process Viewer"
arch=('x86_64')
url="https://www.enlightenment.org"
license=('ISC')
depends=('efl')
makedepends=('meson' 'ninja')
source=("https://download.enlightenment.org/rel/apps/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('13199601aaedd036bf0421516c204d9f9853a8610615cadde482228e3eda6fb6')

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
