# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=libaribcaption-git
pkgver=1.1.1.r2.g41a014d
pkgrel=1
pkgdesc='Caption decoder/renderer library for handling ARIB STD-B24 based TV broadcast captions (git version)'
arch=('x86_64')
url='https://github.com/xqq/libaribcaption/'
license=('MIT')
depends=('fontconfig' 'freetype2')
makedepends=('git' 'cmake')
provides=('libaribcaption')
conflicts=('libaribcaption')
source=('git+https://github.com/xqq/libaribcaption.git')
sha256sums=('SKIP')

pkgver() {
    git -C libaribcaption describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S libaribcaption \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DARIBCC_SHARED_LIBRARY:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 libaribcaption/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
