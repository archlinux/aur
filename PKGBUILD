# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>

pkgname=libuhd-umtrx
pkgver=1.0.19.r13.gfbc40e0
pkgrel=1
pkgdesc="Fairwaves UmTRX module for libuhd"
arch=('x86_64')
url="https://github.com/fairwaves/UHD-Fairwaves"
license=('GPL-3.0-or-later')
depends=('libuhd' 'boost-libs')
makedepends=('git' 'cmake' 'boost')
_gitname=UHD-Fairwaves
_gitcommit=fbc40e06d6ec120524150ae33c6598b0c122651f
source=("git+https://github.com/fixeria/${_gitname}#commit=${_gitcommit}")
sha1sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname/host"
  mkdir -p build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    ../
  make
}

package() {
  cd "$_gitname/host/build"
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
