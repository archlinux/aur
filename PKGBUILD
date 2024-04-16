# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>
# Contributor: Bruno Pagani <archange@archlinux.org>

_android_arch=x86

pkgname=android-${_android_arch}-webp-pixbuf-loader
pkgver=0.2.7
pkgrel=1
arch=('any')
pkgdesc="WebM GDK Pixbuf Loader library (Android ${_android_arch})"
url="https://github.com/aruiz/webp-pixbuf-loader"
license=('LGPL')
depends=("android-${_android_arch}-gdk-pixbuf2"
         "android-${_android_arch}-libwebp")
makedepends=('android-meson')
options=(!strip !buildflags staticlibs !emptydirs)
source=("${url}/archive/${pkgver}/webp-pixbuf-loader-${pkgver}.tar.gz")
sha256sums=('61ce5e8e036043f9d0e78c1596a621788e879c52aedf72ab5e78a8c44849411a')

build() {
    cd "${srcdir}/webp-pixbuf-loader-${pkgver}"
    source android-env ${_android_arch}

    mkdir -p build
    cd build
    android-${_android_arch}-meson
    ninja
}

package() {
    cd "${srcdir}/webp-pixbuf-loader-${pkgver}/build"
    source android-env ${_android_arch}

    DESTDIR="${pkgdir}" ninja install
    find "${pkgdir}/${ANDROID_PREFIX_LIB}" -type f -name '*.so' -exec ${ANDROID_STRIP} -g --strip-unneeded {} \;
}
