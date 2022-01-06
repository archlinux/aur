# Contributor: Eric Fung <loseurmarbles [at] gmail [dot] com>
# Contributor: Iwan Timmer <irtimmer@gmail.com>

pkgname=process-cpp
pkgdesc="A simple convenience library for handling processes in C++11"
pkgver=3.0.1
pkgrel=2
arch=('x86_64' 'i686')
url='https://gitlab.com/ubports/core/lib-cpp/process-cpp/'
license=('LGPL3')
groups=('lib-cpp')
depends=('boost-libs' 'gcc-libs' 'properties-cpp')
makedepends=('cmake' 'boost' 'doxygen' 'graphviz')
source=('https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/process-cpp/3.0.1-9/process-cpp_3.0.1.orig.tar.gz'
        'https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/process-cpp/3.0.1-9/process-cpp_3.0.1-9.debian.tar.xz')
sha256sums=('33d13d384e99d3f57691c9c572c0c38fe4b67c056f19c8d99f18230f62b94a6b'
            '5357427f51704c2cb3768cd81bf1fb254ada7ff355ef656d14c253b322cf37fe')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  #Apply debian patches
  patch -p1 < ../debian/patches/2001-Don-t-run-tests.patch
  patch -p1 < ../debian/patches/1002-Reproducible-documentation.patch
  patch -p1 < ../debian/patches/1003-link-pthread.patch
  patch -p1 < ../debian/patches/1004-spelling-fixes.patch
}

build() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/_build"
  cd "${srcdir}/${pkgname}-${pkgver}/_build"

  cmake -DCMAKE_BUILD_TYPE=Release ..
  cmake --build .
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/_build"

  cmake --install . --prefix="${pkgdir}/usr"
}
