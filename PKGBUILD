# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: zlbgps<zlbgps@gmail.com>

set -u
pkgname='lfhex'
pkgver='0.42'
pkgrel='2'
pkgdesc='A hex editor with support for large files'
arch=('i686' 'x86_64')
url='http://stoopidsimple.com/lfhex'
license=('GPL')
depends=('qt4')
makedepends=('bison' 'flex')
source=("http://stoopidsimple.com/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('4e8f8b99eb271242937037a3af2fe07369b653f7f7d8becbd84554118bf8baba')

prepare() {
  set -u
  cd "${pkgbase}-${pkgver}/src"
  sed -i -e '22i#include <sys/types.h>' 'expr.h'
  set +u
}

build() {
  set -u
  cd "${pkgbase}-${pkgver}/src"
  qmake-qt4
  make -s -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${pkgbase}-${pkgver}"

  # Install binary
  install -Dm755 "src/${pkgbase}" "${pkgdir}/usr/bin/${pkgbase}"

  # Install documentation
  install -Dpm644 'CONTRIBUTORS' 'README' -t "${pkgdir}/usr/share/doc/${pkgbase}/"
  set +u
}
set +u
