# Maintainer: philomath <philomath868 AT gmail DOT com>
# Maintainer: Pavel Borzenkov <pavel@voidptr.ru>

pkgname=pahole
pkgver=1.16
_bpf_ver=0.0.6
pkgrel=1
pkgdesc="Various DWARF utils"
arch=('i686' 'x86_64')
url="http://git.kernel.org/?p=devel/pahole/pahole.git;a=summary"
license=('GPL2')
depends=('elfutils' 'python')
makedepends=('git' 'cmake')
replaces=('dwarves')
source=(
  "https://git.kernel.org/pub/scm/devel/${pkgname}/${pkgname}.git/snapshot/${pkgname}-${pkgver}.tar.gz"
  "libbpf-$_bpf_ver.tar.gz::https://github.com/libbpf/libbpf/archive/v$_bpf_ver.tar.gz"
)
md5sums=('4dcec51a18842cc471340d12ca78cab6'
         '73c12c58350bc348907aef564ebd8d81')
sha1sums=('eae1b968f2d687c591e256acbd2fefd9aa60ee21'
          'a8f6bca240c05aa5049bc8b3a20962ff3916c1e4')

prepare() {
  mkdir -p build
  rm -rf "${pkgname}-${pkgver}/lib/bpf/"*
  cp -r "libbpf-$_bpf_ver/"* "${pkgname}-${pkgver}/lib/bpf"
}

build() {
  cd build
  cmake "../${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX:PATH=/usr -D__LIB=lib
  make
}

package() {
  cd build
  make DESTDIR=${pkgdir}/ install
}

# vim:set ts=2 sw=2 et:
