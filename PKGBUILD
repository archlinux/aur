# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=udr-git
pkgver=v0.9.4.r11.g7885528
pkgrel=3
pkgdesc="A UDT wrapper for rsync that improves throughput of large dataset transfers over long distances."
arch=('i686' 'x86_64')
url="https://github.com/LabAdvComp/UDR"
license=('apache-2.0' )
makedepends=('git')
depends=('openssl' 'crypto++' 'rsync')
makedepends=('git')
provides=('udr')
source=('git://github.com/LabAdvComp/UDR')
md5sums=('SKIP')

pkgver() {
  cd UDR
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/UDR"

  if test "$CARCH" == x86_64; then
    MACHINE=AMD64
  fi
  if test "$CARCH" == i686; then
    MACHINE=IA32
  fi
  unset LDFLAGS # LDFLAGS from /etc/makepkg.conf were causing build failure
  make -j1 -e arch=$MACHINE
}

package() {
  cd "$srcdir/UDR"
  mkdir -p ${pkgdir}/usr/bin/
  install -D -m755  src/udr ${pkgdir}/usr/bin/
}

# vim:set ts=2 sw=2 et:
