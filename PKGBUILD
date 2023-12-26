# Maintainer: gigas002 <gigas002@pm.me>

pkgname=qimgv-qt6-kde-git
_pkgname=qimgv
pkgver=v1.0.3.alpha.r101.g69b28f2
pkgrel=3
pkgdesc="Qt6 image viewer. Fast, configurable, easy to use. Supports video playback."
arch=(x86_64 i686 armv6h armv7h aarch64)
url="https://github.com/easymodo/qimgv"
license=('GPL3')
depends=('qt6-base' 'qt6-imageformats' 'qt6-svg' 'qt6-5compat' 'mpv' 'exiv2' 'opencv')
makedepends=('git' 'cmake' 'pkgconf' 'qt6-tools')
optdepends=('kimageformats5: support for more image formats'
            'qt5-imageformats'
            'qtraw-git: RAW support'
            'qt6-jpegxl-image-plugin: JPEG-XL support'
            # waiting for ports to qt6 for below packages
            # 'qt5-apng-plugin: apng support'
            # 'qt5-avif-image-plugin-git: AVIF support'
            )
provides=("qimgv")
conflicts=("qimgv")
source=(git+"${url}".git)
md5sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    install -d build
}

build() {
    cd "${srcdir}/${_pkgname}/build"
    cmake .. \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DKDE_SUPPORT=ON \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "${srcdir}/${_pkgname}/build"
	make DESTDIR=${pkgdir} install
}
