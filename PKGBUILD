# Maintainer: Carlos Rivas <carlos (a t) twobitcoder (do t) com>
# Contributor: Joost Bremmer <toost dot b at gmail dot com>
 
pkgname=libsoundio-git
pkgver=20150906
pkgrel=1
pkgdesc="A C99 library providing cross-platform audio input and output"
arch=('x86_64')
url="http://www.github.com/andrewrk/libsoundio"
license=('MIT')
source=("git://github.com/andrewrk/libsoundio"
    "jack1_compat.patch")
options=('!buildflags')
md5sums=('SKIP'
'e25c3e74405dfd34ed85e9e36fe52922')

prepare(){
  cd ${srcdir}/libsoundio

    #  reverts to a known build of libsoundio, remove if you wnat the newest
  git revert 'e2e483a4d523acab5a580b1e58a6ebc218da8f5e' --no-edit

    #  jack1 compatibilty for this library is currently broken, and 
    #  as a result it won't build at all unless you disable it
  patch CMakeLists.txt ../jack1_compat.patch
}
 
build() {
  cd ${srcdir}/libsoundio
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}/usr/" .. && make 
}
 
package() {
  cd ${srcdir}/libsoundio/build
  make install
}
