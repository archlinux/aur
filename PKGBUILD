# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=libilbm
pkgname=${_pkgname}-git
pkgver=r75+586f582
pkgrel=1
pkgdesc="Parser library built on top of libiff, for ILBM: IFF Interleaved BitMap format"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/svanderburg/libilbm"
license=('MIT')
depends=('libiff')
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
