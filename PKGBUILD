# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=wdsp-dl1ycf-git
_pkgname=wdsp
pkgver=r116.7ceb35f
pkgrel=1
pkgdesc='NR0V DSP library ported to linux'
arch=('i686' 'x86_64' 'aarch64')
# we use this version because it is up to date
# with windows's version
url='https://github.com/dl1ycf/wdsp'
license=('GPL2')
depends=('fftw')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("${_pkgname}::git+https://github.com/dl1ycf/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  install -D wdsp.h -m 0644 "${pkgdir}/usr/include/wdsp.h"
  install -D libwdsp.so "${pkgdir}/usr/lib/libwdsp.so"
}
