# Maintainer: Cebtenzzre <cebtenzzre (at) gmail (dot) com>

_pkgname=fcode-utils
pkgname="${_pkgname}-git"
pkgver=v1.0.2.r20.gd89219a
pkgrel=1
pkgdesc="A set of utilities to process FCODE, OpenFirmware's byte code"
arch=(x86_64 i686)
url='https://www.openfirmware.info/FCODE_suite'
license=(GPL2 CPL)
depends=('glibc')
makedepends=('git')
source=("git+https://github.com/openbios/${_pkgname}.git"
        'nicer_flags.patch')
sha256sums=('SKIP'
            'eba18cb2f7ecc20a4018a9e79f79d0845b42adba3320240933bd881f3901034e')
provides=('romheaders')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"

  # Fix the not-so-nice flag replacement and ignoring
  patch -p1 -i ../nicer_flags.patch
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make install DESTDIR="$pkgdir/usr"
}
