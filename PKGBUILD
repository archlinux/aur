# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=waifu2x-converter-glsl
pkgver=1.2.0
pkgrel=1
pkgdesc="C++ implementation of waifu2x with OpenGL-based GPU acceleration"
arch=('any')
url="https://github.com/ObserverOfTime/$pkgname"
license=('MIT')
depends=('opencv' 'mesa' 'glfw')
makedepends=('cmake' 'opencl-headers' 'libepoxy' 'libglvnd' 'vtk')
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fd51010218dbad7ad59ce34d1baad0c5867ce75093fe97b0eaf222f3e32c9012')

build() {
    mkdir -p build && cd build
    cmake ../"${pkgname}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_SKIP_RPATH=ON
    cmake --build .
}

package() {
    make -C build DESTDIR="${pkgdir}" install
    install -Dm644 "${pkgname}-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

