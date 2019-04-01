# Maintainer: ObserverOfTime <chronobserver@disroot.org>

pkgname=waifu2x-converter-glsl
pkgver=1.2.1
pkgrel=2
pkgdesc="C++ implementation of waifu2x using OpenGL shaders"
arch=('any')
url="https://github.com/ObserverOfTime/$pkgname"
license=('MIT')
depends=('glfw' 'mesa' 'opencv')
makedepends=(
    'cmake' 'glfw' 'libepoxy' 'libglvnd'
    'mesa' 'opencv' 'pkgconfig' 'vtk'
)
provides=()
conflicts=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('716267d41397852d8b19d969cc5bc56358895a62b9b0a503e2c84f0e195f0a56')

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

