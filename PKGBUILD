# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>

_pkgname=fcode-utils
pkgname="${_pkgname}-git"
pkgver=v1.0.2.r20.gd89219a
pkgrel=2
pkgdesc="Utilities to process FCODE, OpenFirmware's byte code"
arch=(i686 x86_64)
url='https://www.openfirmware.info/FCODE_suite'
license=(GPL2 CPL)
depends=('glibc')
makedepends=('git')
provides=("$_pkgname" 'romheaders')
source=("git+https://github.com/openbios/${_pkgname}.git"
        'fix-flags.patch')
sha256sums=('SKIP'
            'eba18cb2f7ecc20a4018a9e79f79d0845b42adba3320240933bd881f3901034e')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  patch -Np1 <../fix-flags.patch
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  install -D detok/detok romheaders/romheaders toke/toke -t "$pkgdir"/usr/bin
  install -Dm 644 README -t "$pkgdir"/usr/share/doc/fcode-utils
  install -Dm 644 COPYING "$pkgdir"/usr/share/licenses/fcode-utils/LICENSE
}
