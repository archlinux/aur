# PKGBUILD for android-libogg
# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_android_arch=x86-64
source android-env.sh ${_android_arch}

pkgname=android-${_android_arch}-bzip2
pkgver=1.0.6
pkgrel=1
pkgdesc="A high-quality data compression program (android)"
arch=('any')
url="http://sources.redhat.com/bzip2"
license=("custom")
depends=('android-ndk')
options=(!strip !buildflags staticlibs !emptydirs)
makedepends=('android-pkg-config')
source=("https://fossies.org/linux/misc/bzip2-${pkgver}.tar.gz")
sha1sums=('3f89f861209ce81a6bab1fd1998c0ef311712002')

prepare() {
    cd "$srcdir/bzip2-$pkgver"
}

build() {
    cd "$srcdir"/bzip2-$pkgver

    make libbz2.a \
        CC=${ANDROID_CC} \
        AR=${ANDROID_AR} \
        RANLIB=${ANDROID_RANLIB} \
        PREFIX=${ANDROID_LIBS} \
        $MAKEFLAGS
}

package() {
    cd "$srcdir"/bzip2-$pkgver

    install -m755 -d "${pkgdir}"/${ANDROID_LIBS}/include
    install -m644 bzlib.h "${pkgdir}"/${ANDROID_LIBS}/include/
    install -m755 -d "${pkgdir}"/${ANDROID_LIBS}/lib
    install -m644 libbz2.a "${pkgdir}"/${ANDROID_LIBS}/lib/
    ${ANDROID_STRIP} -g "$pkgdir"/${ANDROID_LIBS}/lib/*.a
}
