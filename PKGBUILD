# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libva-nvidia-driver
pkgver=0.0.1
pkgrel=1
pkgdesc='VA-API implementation that uses NVDEC as a backend'
arch=('x86_64')
url='https://github.com/elFarto/nvidia-vaapi-driver/'
license=('unknown')
depends=('gst-plugins-bad-libs' 'nvidia-utils')
makedepends=('git' 'meson' 'cuda' 'libva')
source=("https://github.com/elFarto/nvidia-vaapi-driver/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        '010-libva-nvidia-driver-fix-paths.patch')
conflicts=('libva-vdpau-driver')
sha256sums=('2943835ebb958c736b4b513c07811ee26442517103fcd77089676dc22353d6b4'
            '69879dc917e8da5b45bb8294f0bbcded5f04e657231c9531c2035d789952a18d')

prepare() {
    patch -d "nvidia-vaapi-driver-${pkgver}" -Np1 -i "${srcdir}/010-libva-nvidia-driver-fix-paths.patch"
}

build() {
    arch-meson "nvidia-vaapi-driver-${pkgver}" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
} 
