# Maintainer: Carl Åkerlindh <carl.akerlindh at gmail dot com>
pkgname=mxnet
pkgver=0.9.3
pkgrel=1
pkgdesc="Flexible and Efficient Library for Deep Learning"
arch=('x86_64')
url="http://mxnet.io/"
license=('Apache2')
depends=(cuda cudnn)
# makedepends=()
# checkdepends=()
# optdepends=()
# provides=()
source=("$pkgname::git+https://github.com/dmlc/mxnet")
md5sums=('SKIP')

prepare() {
  cd "$pkgname"
  git checkout "v$pkgver"
  git submodule update --init --recursive
  cp make/config.mk .
  echo "USE_CUDA=1" >>config.mk
  echo "USE_CUDA_PATH=/opt/cuda" >>config.mk
  echo "USE_CUDNN=1" >>config.mk
}

build() {
  cd "$srcdir/$pkgname"
  make -j$(nproc)
}

package() {
  cd "$pkgdir"
  install -D "$srcdir/$pkgname/lib/libmxnet.so" "$pkgdir/usr/lib/libmxnet.so"
}

