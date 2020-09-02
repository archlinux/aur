# Maintainer: Jens Carl <jc [dot] archlinux [at] jens-carl [dot] de>

pkgname=evisum
pkgver=0.5.4
pkgrel=1
pkgdesc="EFL Process Viewer"
arch=('x86_64')
url="https://www.enlightenment.org"
license=('ISC')
depends=('efl')
makedepends=('meson' 'ninja')
source=("https://download.enlightenment.org/rel/apps/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('ea86a49f4c058d323bc629458153b4b362ef9aaaa16ebca32ee499439ae0e3c6')

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
