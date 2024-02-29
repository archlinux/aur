# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

_android_arch=aarch64

pkgname=android-${_android_arch}-hwdata
pkgver=0.379
pkgrel=1
arch=('any')
pkgdesc="hardware identification databases (android)"
depends=('android-ndk')
makedepends=('android-environment')
url="https://github.com/vcrhonek/hwdata"
license=('GPL-2.0-or-later')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://github.com/vcrhonek/hwdata/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('2d8d413696545fd889ca3d32b78f64b5')
validpgpkeys=('3C40194FB79138CE0F78FD4919C2F062574F5403') # Vitezslav Crhonek

build() {
    cd "${srcdir}/hwdata-${pkgver}"
    source android-env ${_android_arch}

    ./configure \
        --prefix="${ANDROID_PREFIX}" \
        --datadir="${ANDROID_PREFIX_SHARE}" \
        --libdir="${ANDROID_PREFIX_LIB}" \
        --disable-blacklist
    make $MAKEFLAGS
}

package() {
    cd "${srcdir}/hwdata-${pkgver}"
    source android-env ${_android_arch}

    make DESTDIR="${pkgdir}" install
}
