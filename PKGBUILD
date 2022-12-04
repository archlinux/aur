pkgname=fastdeploy-git
pkgrel=1
pkgver=r1349.d74e1209
pkgdesc="An Easy-to-use and Fast Deep Learning Model Deployment Toolkit for Cloud Mobile and Edge."
url="https://github.com/PaddlePaddle/FastDeploy"
provides=(fastdeploy)
license=('Apache2')
arch=('x86_64')
source=("FastDeploy::git+https://github.com/PaddlePaddle/FastDeploy.git")
sha512sums=('SKIP')
depends=()
makedepends=(
    gcc \
    cmake 
)

pkgver() {
  cd ${srcdir}/FastDeploy
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build(){
    cd ${srcdir}/FastDeploy
    cmake -S . -B build \
        -DENABLE_ORT_BACKEND=ON \
        -DENABLE_PADDLE_BACKEND=ON \
        -DENABLE_OPENVINO_BACKEND=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_VISION=ON \
        -DENABLE_TEXT=ON 
    cmake --build build
}
package(){
    cd ${srcdir}/FastDeploy
    DESTDIR=${pkgdir} cmake --install build
}
