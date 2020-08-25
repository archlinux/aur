# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=ospray-studio-git
pkgver=r168.gde9e9c4
pkgrel=1
pkgdesc="Application to showcase OSPRay's rendering capabilities (git version)"
arch=('x86_64')
url='https://github.com/ospray/ospray_studio/'
license=('Apache')
depends=('ospray' 'glfw' 'libgl')
makedepends=('git' 'cmake' 'openimagedenoise' 'tbb' 'ispc')
source=('git+https://github.com/ospray/ospray_studio.git')
sha256sums=('SKIP')

pkgver() {
    printf 'r%s.g%s' "$(git -C ospray_studio rev-list --count HEAD)" \
                     "$(git -C ospray_studio rev-parse --short HEAD)"
}

build() {
    cmake -B build -S ospray_studio \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_SKIP_RPATH='YES' \
        -Wno-dev
    make -C build
}

package() {
    install -D -m755 build/ospStudio -t "${pkgdir}/usr/bin"
    install -D -m755 build/libospray_studio.so -t "${pkgdir}/usr/lib"
}
