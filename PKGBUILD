# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: huyz

pkgname=libva-nvidia-driver-git
pkgver=0.0.11.r1.gea6d862
pkgrel=1
pkgdesc='VA-API implementation that uses NVDEC as a backend (git version)'
arch=('x86_64')
url='https://github.com/elFarto/nvidia-vaapi-driver'
license=('MIT')
depends=('gst-plugins-bad-libs' 'nvidia-utils')
makedepends=('meson' 'ffnvcodec-headers' 'git')
provides=('libva-nvidia-driver')
conflicts=('libva-nvidia-driver' 'libva-vdpau-driver')
source=("${pkgname}::git+https://github.com/elFarto/nvidia-vaapi-driver.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
    cd ${pkgname}

    arch-meson . build
    meson compile -C build
}

package() {
    cd ${pkgname}

    meson install -C build --destdir "${pkgdir}"
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
