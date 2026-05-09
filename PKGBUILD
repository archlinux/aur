# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: huyz

pkgname=libva-nvidia-driver-git
pkgver=0.0.17.r0.g0ba758d
pkgrel=1
pkgdesc='VA-API implementation that uses NVDEC as a backend (git version)'
arch=('x86_64')
url='https://github.com/elFarto/nvidia-vaapi-driver'
license=('MIT')
depends=('gst-plugins-bad-libs' 'libegl')
makedepends=('git' 'meson' 'ffnvcodec-headers' 'libva')
provides=('libva-nvidia-driver')
conflicts=('libva-nvidia-driver' 'libva-vdpau-driver')
source=("${pkgname}::git+https://github.com/elFarto/nvidia-vaapi-driver.git")
b2sums=('SKIP')

pkgver() {
    cd ${pkgname}

    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd ${pkgname}

    arch-meson . build

    meson compile -C build
}

package() {
    cd ${pkgname}

    meson install -C build --destdir "${pkgdir}"

    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/libva-nvidia-driver/LICENSE
}
