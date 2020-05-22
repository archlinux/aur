# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: GONG Chen <chen dot sst at gmail dot com>
# Contributor: 網軍總司令

pkgname=librime
pkgver=1.5.3
pkgrel=9
epoch=1
pkgdesc="Rime input method engine"
arch=('x86_64')
url="https://github.com/rime/librime"
license=('GPL3')
depends=('boost-libs' 'opencc' 'yaml-cpp' 'leveldb' 'librime-data' 'google-glog' 'marisa')
makedepends=('cmake' 'boost' 'gtest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rime/librime/archive/$pkgver.tar.gz"
        $pkgname-opencc-1.1.patch::https://github.com/rime/librime/commit/beae5b1d4e990aeb05eb86db5eefec50fa03750b.patch)
sha512sums=('4d7f6ec43bd5728f59f0b3581bcd8a46128651430b6873017d80659942b8f6aa1a2f25f439ba8fba461fe22acbf701c2da7a786104a2e4852a70a89cdc0452d3'
            'e4c29f916cbee7c786262f17a475d2f645a88ef7709689df53c5e16d7ec6fe8ccbd1f9f246ef03a5f3412fa387f9db5025e1cfb7fa4bfd392a23525e28689bda')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../$pkgname-opencc-1.1.patch
}

build() {
  cd $pkgname-$pkgver
  export CXXFLAGS="$CXXFLAGS -DNDEBUG"
  cmake . -Bbuild -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}
