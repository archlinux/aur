# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=vapoursynth-plugin-d2vsource
pkgver=1.4
pkgrel=1
pkgdesc="Plugin for Vapoursynth: d2vsource"
arch=('x86_64')
url='https://github.com/dwbuiten/d2vsource'
license=('LGPL2.1-only')
depends=('ffmpeg' 'vapoursynth')
makedepends=('meson')
source=("https://github.com/dwbuiten/d2vsource/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('8389fe45f6ba05409d0f76ec03ffbdc53c153169073e985d5880b173ec2174cbd5b96ab860fb4e70cb6a08c17fc1db8185418a6a369dc9b1058eb3dd7ccd3500')

build() {
    cd d2vsource-${pkgver}

    arch-meson build \
        --buildtype=release \
        -Dwarning_level=2 \
        -Db_lto=true \
        -Db_ndebug=if-release \
        -Dcpp_std=c++17

    meson compile -C build
}

package(){
    cd d2vsource-${pkgver}

    meson install -C build --destdir "${pkgdir}"

    install -Dm644 -t "${pkgdir}"/usr/share/doc/vapoursynth/plugins/d2vsource README.md
}
