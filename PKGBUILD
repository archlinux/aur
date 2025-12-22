# Maintainer: Leandro Vital <leavitals@gmail.com>
pkgname=ack-cpm
_pkgname=ack
pkgver=dev
pkgrel=1
pkgdesc="A C compiler for 8-bit CPUs, configured for CP/M"
arch=('x86_64')
url="https://github.com/davidgiven/ack"
license=('BSD-3-Clause')
provides=("ack=${pkgver}")
conflicts=('ack' 'ack-git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  sed -i 's/PLATS = all/PLATS = cpm/' Makefile
}

build() {
  cd "${srcdir}/${_pkgname}"
  unset CFLAGS
  unset HOSTCFLAGS
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  unset CFLAGS
  unset HOSTCFLAGS
  make PREFIX="${pkgdir}/usr" install
}
