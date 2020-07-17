# Maintainer: Jens Carl <jc [dot] archlinux [at] jens-carl [dot] de>

pkgname=evisum
pkgver=0.5.1
pkgrel=1
pkgdesc="EFL Process Viewer"
arch=('x86_64')
url="https://www.enlightenment.org"
license=('ISC')
depends=('efl')
makedepends=('meson' 'ninja')
source=("https://download.enlightenment.org/rel/apps/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('26404ad32dd6be277055f76be4fd6b5b692b2464a5322cd84ef45ba799b380be')

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
