# Maintainer: Bart De Vries <bart at mogwai dot be>

_pkgname=box86
pkgname=${_pkgname}-git
pkgver=v0.1.2.r294.g9119443c
pkgrel=1
pkgdesc='Linux Userspace x86 Emulator with a twist'
arch=('armv7h')
url='https://github.com/ptitSeb/box86'
license=('MIT')
depends=('gcc-libs')
#optdepends=('')
makedepends=('git')
source=("git+https://github.com/ptitSeb/box86.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgname}
  mkdir build
}

build() {
  cd ${_pkgname}/build

  cmake .. -DARM_DYNAREC=ON \
           -DCMAKE_BUILD_TYPE=RelWithDebInfo \
           -DCMAKE_INSTALL_PREFIX=/usr
  make 
}

package() {
  cd ${_pkgname}/build

  make DESTDIR=${pkgdir} install

  install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

