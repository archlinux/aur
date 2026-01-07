# Maintainer: Gl1tchs <berkeumtbiricik@gmail.com>
pkgname=glgpu-git
pkgver=1.0.1.r2.gd3f1427
pkgrel=1
pkgdesc="Low-Level, low dependency rendering interface over the Vulkan API"
arch=('x86_64')
url="https://github.com/Gl1tchs/glgpu"
license=('MIT')
groups=()

depends=('vulkan-icd-loader')

makedepends=('git' 'cmake' 'ninja' 'vulkan-headers')

provides=('glgpu')
conflicts=('glgpu')

source=("git+https://github.com/Gl1tchs/glgpu.git")
md5sums=('SKIP')

pkgver() {
    cd "glgpu"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -S glgpu -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DGL_BUILD_EXAMPLES=OFF \
        -DGL_BUILD_TESTS=OFF

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 glgpu/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
