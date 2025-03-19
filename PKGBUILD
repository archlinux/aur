# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Bruno Pagani <archange@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-utf8cpp
pkgver=4.0.6
pkgrel=1
arch=('any')
pkgdesc="UTF-8 with C++ in a Portable Way (Android ${_android_arch})"
url="https://github.com/nemtrif/utfcpp"
license=('custom:BSL')
groups=('android-utf8cpp')
depends=('android-ndk')
makedepends=('android-cmake')
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/archive/v${pkgver}/utf8cpp-${pkgver}.tar.gz")
md5sums=('3b79abe634ef157f04bd16aad809889b')

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
