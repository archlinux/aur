# Maintainer: RoboMico <robomico at outlook dot com>
pkgname=ws63flash-git
pkgver=v0.3.1.r0.ge1d359e
pkgrel=1
pkgdesc="HiSilicon WS63 chip flashing tool"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/goodspeed34/ws63flash"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'autoconf' 'automake' 'gcc' 'make' 'musl')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/ws63flash"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/ws63flash"
  autoreconf -fi
  CC="musl-gcc" ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/ws63flash"
  make DESTDIR="${pkgdir}" install
}
