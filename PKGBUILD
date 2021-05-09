# Maintainer: Jens Carl <jc [dot] archlinux [at] jens-carl [dot] de>

pkgname=evisum
pkgver=0.5.13
pkgrel=2
pkgdesc="EFL Process Viewer"
arch=('x86_64')
url="https://www.enlightenment.org"
license=('ISC')
depends=('efl')
makedepends=('meson' 'ninja')
source=("https://download.enlightenment.org/rel/apps/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('4cc571c7b0fdc1dba3c8de8f71b2310bc33acdbcb99b2bf13bd02aa25adc58e6')

build() {
    arch-meson $pkgname-$pkgver build
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    DESTDIR="$pkgdir" meson install -C build
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
