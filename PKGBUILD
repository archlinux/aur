# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=openhmd
pkgver=0.3.0
pkgrel=1
pkgdesc='API and drivers for immersive technology devices'
arch=('x86_64')
url='https://github.com/OpenHMD/OpenHMD/'
license=('Boost')
depends=('glibc' 'hidapi' 'xr-hardware')
makedepends=('meson')
source=("https://github.com/OpenHMD/OpenHMD/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ec5c97ab456046a8aef3cde6d59e474603af398f1d064a66e364fe3c0b26a0fa')

build() {
    arch-meson -Dexamples='' build "OpenHMD-${pkgver}"
    ninja -C build
}

check() {
    ninja -C build test
}

package() {
    DESTDIR="$pkgdir" ninja install -C build
}
