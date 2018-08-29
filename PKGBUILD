# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: bender02 at gmx dot com

set -u
pkgname='v7_sh'
pkgver='0'
pkgrel='1'
pkgdesc='A port of original Steve Bourne shell from 1978'
arch=('i686' 'x86_64')
url='http://riemann.fmi.uni-sofia.bg/sh/'
license=('custom')
makedepends=('dietlibc')
#source=("http://riemann.fmi.uni-sofia.bg/sh/${pkgname}.tar.gz")
source=("http://aur.zapto.org/PRIVATE/${pkgname}.tar.gz")
md5sums=('e503e6110a95a8387421f5c938e0ce92')
sha256sums=('e096dacd4bab4b6b4eecc63f0016ff72f83739258ff0376f54775b68db728b72')

build() {
  set -u
  cd "${srcdir}/${pkgname}"
  make CC='/opt/diet/bin/diet -Os gcc -W'
  set +u
}

check() {
  set -u
  cd "${srcdir}/${pkgname}"
  make tests
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}"
  # need to use some other name than 'sh', since /bin/sh is already owned by bash package
  install -Dm755 'sh' "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 'NOTICE.pdf' "${pkgdir}/usr/share/licenses/${pkgname}/notice.pdf"
  set +u
}
set +u
