# Maintainer : doragasu <doragasu at hotmail dot com>
# Original submitter: speps <speps at aur dot archlinux dot org>

_pkg=p7zip
_ver=16.02
pkgname=lib7zip
pkgver=3.0.0
pkgrel=1
pkgdesc="A library using 7z.dll/7z.so(from 7-Zip) to handle different archive types."
arch=(i686 x86_64)
url="https://github.com/stonewell/lib7zip"
license=('MPL')
makedepends=('libtool')
options=('!libtool')
source=("https://github.com/stonewell/${pkgname}/archive/${pkgver}.tar.gz"
        "http://downloads.sourceforge.net/project/${_pkg}/${_pkg}/${_ver}/${_pkg}_${_ver}_src_all.tar.bz2")
sha256sums=('75def3c6393ff4eb390ed5b82f89edc1b93fd1ac92680556a8d9a4e5cad7257c'
            '5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6e2341f')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # point to p7zip source
    export P7ZIP_SOURCE_DIR="$srcdir/${_pkg}_${_ver}"

    cmake -DBUILD_SHARED_LIB=ON \
	    -DP7ZIP_SOURCE_DIR=${P7ZIP_SOURCE_DIR} \
	    -DCMAKE_BUILD_TYPE=RELEASE
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/src"

    # Provided CMakeLists does not install files, so install manually
    install -Dm755 $pkgname.so $pkgdir/usr/lib/${pkgname}.so
    install -Dm644 $pkgname.h $pkgdir/usr/include/${pkgname}.h
}
