# Maintainer: Alex Medvědů <a13xie@mcld.eu>

pkgname=ppm-git
_pkgname=ppm
_gitname=plugin-manager
pkgver=1.0.5.r0.gc1f8a7a
pkgrel=1
pkgdesc='A plugin manager for the Pragtical editor'
arch=('x86_64' 'aarch64')
url="https://github.com/pragtical/plugin-manager"
license=('MIT')
depends=('pragtical')
makedepends=('git' 'cmake' 'gcc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/pragtical/plugin-manager")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --tags --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

prepare() {
  cd "${_gitname}"
  git submodule update --init
}

build() {
  cd "${_gitname}"
  ./build.sh -DPPM_STATIC \
             -static
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "${srcdir}/${_gitname}"/ppm "$pkgdir/usr/bin"
}
