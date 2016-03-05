# Maintainer: slava.ganzin <slava.ganzin@gmail.com>
pkgname=deepdetect-git
pkgver=r544.c8556f0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Open Source + Deep Learning + API + Server"
url="http://www.deepdetect.com/"
license=('GPL')
depends=(
'eigen'
'google-glog'
'gflags'
'opencv'
'cpp-netlib'
'boost'
'curl'
'libcurlpp'
'utf8cpp'
'openblas-lapack'
'protobuf'
'hdf5'
'leveldb'
'snappy'
'lmdb'
)
makedepends=('git' 'gcc')
optdepends=('cuda: GPL processing')
provides=('dede')
source=("$pkgname::git+https://github.com/beniz/deepdetect.git")
md5sums=('SKIP')


pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# build() {
#   cd "$srcdir"
#   sed -i s/find.*Eigen.*// $pkgname/CMakeLists.txt
#   cmake $pkgname -DEIGEN3_INCLUDE_DIR=/usr/include/eigen3
#   make
# }

package() {
  mkdir $pkgdir/usr/lib -p
  install -Dm755  $srcdir/main/dede $pkgdir/usr/bin/dede
  install -Dm755 $srcdir/caffe_dd/src/caffe_dd/.build_release/lib/* $pkgdir/usr/lib

  mkdir $pkgdir/usr/share/$pkgname -p
  cp -r $srcdir/templates $srcdir/caffe_dd/src/caffe_dd/{data,docs,examples,models,python,scripts} $pkgdir/usr/share/$pkgname
  ln -s $pkgdir/usr/share/$pkgname ~/.deepdetect
}
