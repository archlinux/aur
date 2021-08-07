# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=qimgv-light-git
pkgver=0.9.2.alpha2.r73.gdee226f6
pkgrel=1
pkgdesc='Qt6 image viewer (git, without any optional features)'
arch=(x86_64 i686 armv6h armv7h aarch64)
url=https://github.com/easymodo/qimgv
license=(GPL3)
depends=(qt6-base qt6-imageformats qt6-svg qt6-5compat)
makedepends=(cmake qt6-tools git)
provides=("${pkgname%-light-git}")
conflicts=("${pkgname%-light-git}")
optdepends=('kimageformats: support for more image formats'
            'qtraw: raw images support')
source=(git+"${url}".git)
sha256sums=('SKIP')

pkgver() {
    git -C "${pkgname%-light-git}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -B build -S "${pkgname%-light-git}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DEXIV2=OFF \
        -DVIDEO_SUPPORT=OFF \
        -DOPENCV_SUPPORT=OFF \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
