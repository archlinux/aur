# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=libiff
pkgname=${_pkgname}-git
pkgver=r83+b5f542a
pkgrel=1
pkgdesc="Parser for Electronic Arts' Interchange File Format (IFF)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/svanderburg/libiff"
license=('MIT')
makedepends=('help2man' 'git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf 'r%s+%s' `git rev-list --count HEAD` `git rev-parse --short HEAD`
}

prepare() {
  cd "${_pkgname}"
  ./bootstrap
}

build() {
  cd "${_pkgname}"
  ./configure --prefix=/usr 
  # Need to specify -j1 or with multiple jobs help2man will fail
  make -j1
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
