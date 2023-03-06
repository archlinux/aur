# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: huyz

pkgname=libva-nvidia-driver-git
pkgver=0.0.8.r63.g766d843
pkgrel=1
pkgdesc='VA-API implementation that uses NVDEC as a backend (git version)'
arch=('x86_64')
url='https://github.com/elFarto/nvidia-vaapi-driver'
license=('MIT')
depends=('gst-plugins-bad-libs' 'nvidia-utils')
makedepends=('ffnvcodec-headers' 'git' 'meson')
provides=('libva-nvidia-driver' 'nvidia-vaapi-driver')
conflicts=('libva-nvidia-driver' 'libva-vdpau-driver' 'nvidia-vaapi-driver')
source=("${pkgname}::git+https://github.com/elFarto/nvidia-vaapi-driver.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname}

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
    cd ${pkgname}

    arch-meson . build

    ninja -C build
}

package() {
    cd ${pkgname}

    DESTDIR="${pkgdir}" ninja -C build install

    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
