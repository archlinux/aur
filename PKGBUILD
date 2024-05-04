# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Bruno Pagani <archange@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-utf8cpp
pkgver=4.0.5
pkgrel=1
arch=('any')
pkgdesc="UTF-8 with C++ in a Portable Way (Android ${_android_arch})"
url="https://github.com/nemtrif/utfcpp"
license=('custom:BSL')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/archive/v${pkgver}/utf8cpp-${pkgver}.tar.gz")
sha256sums=('ffc668a310e77607d393f3c18b32715f223da1eac4c4d6e0579a11df8e6b59cf')

build() {
    cd "${srcdir}/utfcpp-$pkgver"
    source android-env ${_android_arch}

    android-${_android_arch}-cmake \
        -S . \
        -B build \
        -DUTF8_TESTS=OFF
    make -C build $MAKEFLAGS
}

package() {
    cd "${srcdir}/utfcpp-$pkgver"
    source android-env ${_android_arch}

    make -C build DESTDIR="${pkgdir}" install
}
