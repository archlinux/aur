# Maintainer: Gl1tchs <berkeumtbiricik@gmail.com>
pkgname=gpukit-git
pkgver=1.2.0.r2.g8a829fa
pkgrel=1
pkgdesc="Low-Level, low dependency rendering interface over the Vulkan API"
arch=('x86_64')
url="https://github.com/Gl1tchs/gpukit"
license=('MIT')
groups=()

depends=('vulkan-icd-loader')

makedepends=('git' 'cmake' 'ninja' 'vulkan-headers')

provides=('gpukit')
conflicts=('gpukit')

source=("git+https://github.com/Gl1tchs/gpukit.git")
md5sums=('SKIP')

pkgver() {
    cd "gpukit"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -S gpukit -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DGPUKIT_BUILD_EXAMPLES=OFF \
        -DGPUKIT_BUILD_TESTS=OFF

    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 gpukit/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
