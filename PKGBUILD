# Maintainer: philomath <philomath868 AT gmail DOT com>
# Maintainer: Pavel Borzenkov <pavel@voidptr.ru>

pkgname=pahole
pkgver=1.17
_bpf_ver=0.0.7
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
md5sums=('3e1b048f1e460e979d44e97ee54af8b4'
         'e29cb129e871dd84a20df2c779d91cc0')
sha1sums=('4fc480f4113dde8bfe7988c1923d56ee61a4a278'
          'd0ebd571d21c85233e57632212b69e8973d33534')

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
